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
