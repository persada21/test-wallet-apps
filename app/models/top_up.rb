class TopUp < ApplicationRecord
  has_many   :transactions, as: :grant, dependent: :destroy
  belongs_to :sender, class_name: 'Stock'
  belongs_to :receiver, class_name: 'Account'

  validates :amount, presence: true

  def create_log_transactions
    code = Faker::Code.npi
    transactions.build(subject: 'receiver', transactable: receiver)
    transactions.build(subject: 'sender', transactable: sender)
  end
end