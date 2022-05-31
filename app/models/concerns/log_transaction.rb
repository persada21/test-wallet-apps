# create transaction log history

module LogTransaction
  extend ActiveSupport::Concern

  def create_log_transactions
    transactions.build(subject: 'receiver', transactable: receiver)
    transactions.build(subject: 'sender', transactable: sender)
  end
end
