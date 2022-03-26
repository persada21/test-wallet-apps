class TopUpsController < ApplicationController
  before_action :set_top_up, only: [:show, :edit, :update, :destroy]

  def index
    @search   = TopUp.ransack(params[:q])
    @top_ups = @search.result(distinct: true)
  end

  def show
  end

  def new
    @top_up = TopUp.new
  end

  def edit
  end
  
  def create
    @top_up = TopUp.new(top_up_params)
    @top_up.create_log_transactions
    respond_to do |format|
      if (@top_up.sender.balance >= @top_up.amount) && @top_up.save
        format.html { redirect_to @top_up, notice: 'Top Up was successfully created.' }
        format.json { render :show, status: :created, location: @top_up }
      else
        format.html { render :new }
        format.json { render json: @top_up.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @top_up.update(top_up_params)
        format.html { redirect_to @top_up, notice: 'Top Up was successfully updated.' }
        format.json { render :show, status: :ok, location: @top_up }
      else
        format.html { render :edit }
        format.json { render json: @top_up.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @top_up.destroy
    respond_to do |format|
      format.html { redirect_to top_up_url, notice: 'Top Up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top_up
      @top_up = TopUp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def top_up_params
      params.require(:top_up).permit(:amount, :receiver_id, :sender_id, :code)
    end
end
