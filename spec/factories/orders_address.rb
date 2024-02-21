FactoryBot.define do
  factory :order_address do
    postal_code {'111-1111'}
    prefecture_id { 1 }
    city { '東京都' }
    addresses { '1-1' }
    phone_number {'11111111111'}
  end
end