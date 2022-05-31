class CalculateServices
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    calculate_balance
  rescue ActiveRecord::RecordInvalid => e
    raise StandardError, e.record.errors.full_messages.to_sentence
  end

  def calculate_balance
    case @transaction.subject

    when 'sender'
      @transaction.transactable
                  .update(balance: @transaction.transactable.balance - @transaction.grant.amount)
    when 'receiver'
      @transaction.transactable
                  .update(balance: @transaction.transactable.balance + @transaction.grant.amount)
    end
  end
end
