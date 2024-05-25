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
class Item < ApplicationRecord
  # Associations
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  # Validations
  validates_presence_of :name, :item_type, :stock, :price, :thumbnail, :description
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
