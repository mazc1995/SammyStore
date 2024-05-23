# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  subtotal   :decimal(, )
#  cart_id    :bigint           not null
#  item_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
end
