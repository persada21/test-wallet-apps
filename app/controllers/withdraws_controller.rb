class WithdrawsController < ApplicationController
  before_action :set_withdraw, only: %i[show edit update destroy]

  def index
    @search = Withdraw.ransack(params[:q])
    @withdraws = @search.result(distinct: true)
  end

  def show; end

  def new
    @withdraw = Withdraw.new
  end

  def create
    @withdraw = Withdraw.new(withdraw_params)
    @withdraw.create_log_transactions
    respond_to do |format|
      if @withdraw.save
        format.html { redirect_to @withdraw, notice: 'Withdraw was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @withdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @withdraw.destroy
    respond_to do |format|
      format.html { redirect_to transfer_url, notice: 'Withdraw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_withdraw
    @withdraw = Withdraw.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def withdraw_params
    params.require(:withdraw).permit(:amount, :receiver_id, :sender_id, :receiver_number)
  end
end
