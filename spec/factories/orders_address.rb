FactoryBot.define do
  factory :order_address do
    postal_code { '111-1111' }
    prefecture_id { 1 }
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ハイツ' }
    phone_number { '11111111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
