# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  subtotal   :float
#  cart_id    :bigint           not null
#  item_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:item) { create(:item, price: 10.0) }
  let(:cart) { create(:cart) }

  it 'has a valid factory' do
    expect(build(:cart_item)).to be_valid
  end

  it 'is invalid without a quantity' do
    expect(build(:cart_item, quantity: nil)).to_not be_valid
  end

  it 'is invalid with a negative quantity' do
    expect(build(:cart_item, quantity: -1)).to_not be_valid
  end

  it 'is invalid without a subtotal' do
    expect(build(:cart_item, subtotal: nil)).to_not be_valid
  end

  it 'is invalid with a negative subtotal' do
    expect(build(:cart_item, subtotal: -1)).to_not be_valid
  end
end
