class TopUp < ApplicationRecord
  include LogTransaction
  has_many   :transactions, as: :grant, dependent: :destroy
  belongs_to :sender, class_name: 'Stock'
  belongs_to :receiver, class_name: 'Account'

  validate :ensure_amount_correct
  validates :amount, presence: true

  def ensure_amount_correct
    errors.add(:amount, 'Stock balance less than top up amount') if sender.balance <= amount
  end
end
