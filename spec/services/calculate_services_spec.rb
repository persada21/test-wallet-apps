require 'rails_helper'

describe CalculateServices do

  let(:create_top_up) do
    FactoryBot.create(:transaction_top_up)
  end

  let(:create_transfer) do
    FactoryBot.create(:transaction_transfer)
  end

  let(:stock) do
    FactoryBot.create(:stock)
  end

  let(:wallet_sender) do
    FactoryBot.create(:account)
  end

  describe 'calculate balance' do

    it 'transaction top up' do
      top_up = create_top_up
      CalculateServices.new(top_up).perform
      expect(top_up.grant.amount.to_f).to eq(5000.0)
    end

    it 'account got top up and calculate balance ' do 
      top_up = create_top_up
      CalculateServices.new(top_up).perform
      expect(top_up.grant.receiver.balance.to_f).to eq(5000.0)
    end

    it 'transaction transfer sender got refuction balance ' do
      transfer = FactoryBot.create(:transaction_transfer)
      CalculateServices.new(transfer).perform
      expect(transfer.transactable.balance.to_f).to eq(3000.0)
    end

  end
end