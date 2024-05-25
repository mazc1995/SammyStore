# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  name        :string
#  item_type   :string
#  stock       :integer
#  price       :float
#  thumbnail   :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
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
