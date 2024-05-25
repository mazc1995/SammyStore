# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  total      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :cart do
    total { 0.0 }
  end
end
