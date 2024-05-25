# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  total      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  # Associations
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  # Validations
  validates :total, numericality: { greater_than_or_equal_to: 0 }

  # Callbacks
  before_create :set_initial_total

  def update_total
    total = cart_items.sum(:subtotal)
    update_column(:total, total)
  end

  private

  def set_initial_total
    self.total = 0
  end
end
