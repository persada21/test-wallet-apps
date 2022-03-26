class TransactionsController < ApplicationController
  before_action :set_transactions, only: [:show]

  def index
    @search   = Transaction.ransack(params[:q])
    @transactions = @search.result(distinct: true)
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transactions
      @transaction = Transaction.find(params[:id])
    end
end