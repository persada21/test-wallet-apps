class CalculateServices
  def initialize(transaction)
  	@transaction = transaction
  end

  def perform
    calculate_balance
  end

  def calculate_balance
    case @transaction.subject
    when 'sender'
      @transaction.transactable
                  .update(balance: @transaction.transactable.balance - @transaction.grant.amount)
    when 'receiver'
      @transaction.transactable
                  .update(balance: @transaction.transactable.balance + @transaction.grant.amount)
    else
      'Error'
    end
  end
end