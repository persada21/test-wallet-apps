require 'rails_helper'
RSpec.describe TopUpsController, type: :controller do
  let(:create_top_up) do
    FactoryBot.create(:top_up)
  end

  let(:stock) do
    FactoryBot.create(:stock)
  end

  let(:insufficient_stock) do
    FactoryBot.create(:stock, balance: 0)
  end

  let(:receiver) do
    FactoryBot.create(:account)
  end

  let(:valid_attributes) do
    {
      amount: 50,
      sender_id: stock.id,
      receiver_id: receiver.id
    }
  end

  let(:invalid_attributes) do
    {
      amount: 1,
      sender_id: insufficient_stock.id,
      receiver_id: receiver.id
    }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new TopUp' do
        expect do
          post :create, params: { top_up: valid_attributes }
        end.to change(TopUp, :count).by(1)
      end

      it 'redirects to the created top_up' do
        post :create, params: { top_up: valid_attributes }
        expect(response).to redirect_to(TopUp.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        expect do
          post :create, params: { top_up: invalid_attributes }
        end.to change(TopUp, :count).by(0)
      end
    end
  end
end
