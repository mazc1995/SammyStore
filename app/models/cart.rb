# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items

  validates :total, numericality: { equal_to: 0 }

  # Callbacks
  before_create :set_initial_total

  def update_total
    cart_items.sum(&:subtotal)
    save
  end

  private

  def set_initial_total
    self.total = 0
  end
end
