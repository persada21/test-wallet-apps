require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end
end
