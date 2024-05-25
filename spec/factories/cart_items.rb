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
FactoryBot.define do
  factory :cart_item do
    association :cart
    association :item
    quantity { 1 }
    subtotal { 500 }
  end
end
