class Withdraw < ApplicationRecord
  has_many   :transactions, as: :grant, dependent: :destroy
  belongs_to :sender, class_name: 'Account'
  belongs_to :receiver, class_name: 'Stock'

  validates :amount, presence: true
  validates :receiver_number, presence: true

  def create_log_transactions
    transactions.build(subject: 'receiver', transactable: receiver)
    transactions.build(subject: 'sender', transactable: sender)
  end
end