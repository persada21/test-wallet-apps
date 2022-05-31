class Withdraw < ApplicationRecord
  include LogTransaction

  has_many   :transactions, as: :grant, dependent: :destroy
  belongs_to :sender, class_name: 'Account'
  belongs_to :receiver, class_name: 'Stock'

  validate :ensure_amount_correct
  validates :amount, presence: true
  validates :receiver_number, presence: true

  def ensure_amount_correct
    errors.add(:amount, 'Stock balance less than top up amount') if sender.balance <= amount
  end
end
