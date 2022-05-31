class TopUp < ApplicationRecord
  include LogTransaction
  has_many   :transactions, as: :grant, dependent: :destroy
  belongs_to :sender, class_name: 'Stock'
  belongs_to :receiver, class_name: 'Account'

  validates :amount, presence: true
end