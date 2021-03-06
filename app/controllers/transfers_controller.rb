class TransfersController < ApplicationController
  before_action :set_transfer, only: %i[show edit update destroy]

  def index
    @search = Transfer.ransack(params[:q])
    @transfers = @search.result(distinct: true)
  end

  def show; end

  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.new(transfer_params)
    @transfer.create_log_transactions
    respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer, notice: 'Transfer was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to transfer_url, notice: 'Transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transfer
    @transfer = Transfer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transfer_params
    params.require(:transfer).permit(:amount, :receiver_id, :sender_id, :code)
  end
end
