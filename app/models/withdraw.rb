class Withdraw < ApplicationRecord
  include LogTransaction

  has_many   :transactions, as: :grant, dependent: :destroy
  belongs_to :sender, class_name: 'Account'
  belongs_to :receiver, class_name: 'Stock'

  validates :amount, presence: true
  validates :receiver_number, presence: true
end