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
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  # Callbacks
  before_create :set_initial_total

  validates :total, numericality: { greater_than_or_equal_to: 0 }

  def update_total
    total = cart_items.sum(:subtotal)
    update_column(:total, total)
  end

  private

  def set_initial_total
    self.total = 0
  end
end
