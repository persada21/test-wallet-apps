class Transaction < ApplicationRecord
  extend Enumerize

  belongs_to :grant, polymorphic: true
  belongs_to :transactable, polymorphic: true

  after_create :calculate_balance

  enumerize :subject, in: %i[sender receiver]

  def calculate_balance
    CalculateServices.new(self).perform
  end

  def sender_address
    if grant_type == 'TopUp'
      grant.sender.code    
    else
      grant.sender.number
    end
  end

  def receiver_address
    if grant_type == 'Withdraw'
      grant.receiver.code    
    else
      grant.receiver.number
    end
  end
end