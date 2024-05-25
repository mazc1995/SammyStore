require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a valid factory' do
    expect(build(:item)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:item, name: nil)).to_not be_valid
  end

  it 'is invalid with a negative price' do
    expect(build(:item, price: -1)).to_not be_valid
  end

  it 'is invalid with a negative stock' do
    expect(build(:item, stock: -1)).to_not be_valid
  end
end
