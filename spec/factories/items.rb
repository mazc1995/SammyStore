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
FactoryBot.define do
  factory :item do
    name { 'Test Item' }
    item_type { 'Product' }
    stock { 10 }
    price { 5.0 }
    thumbnail { 'test.png' }
    description { 'Test description' }
  end
end
