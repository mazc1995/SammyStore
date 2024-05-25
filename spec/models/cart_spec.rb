require 'rails_helper'

RSpec.describe Cart, type: :model do
  it 'has a valid factory' do
    expect(build(:cart)).to be_valid
  end

  it 'sets total to 0 on creation' do
    cart = create(:cart)
    expect(cart.total).to eq(0.0)
  end

  it 'is invalid with a negative total' do
    binding.pry
    expect(build(:cart, total: -1)).to_not be_valid
  end
end
