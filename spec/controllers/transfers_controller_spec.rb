require 'rails_helper'
RSpec.describe TransfersController, type: :controller do


  let(:create_transfer) do
    FactoryBot.create(:transfer)
  end

  let(:account) do
    FactoryBot.create(:account)
  end

  let(:receiver) do
    FactoryBot.create(:account)
  end

  let(:valid_attributes) do
    {
      amount: 50,
      sender_id: account.id,
      receiver_id: receiver.id
    }
  end

  let(:invalid_attributes) do
    {
      amount: 9999999999999999999,
      sender_id: account.id,
      receiver_id: receiver.id
    }
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Transfer" do
        expect {
          post :create, params: {transfer: valid_attributes}
        }.to change(Transfer, :count).by(1)
      end

      it "redirects to the created transfer" do
        post :create, params: {transfer: valid_attributes}
        expect(response).to redirect_to(Transfer.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {transfer: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  

end
