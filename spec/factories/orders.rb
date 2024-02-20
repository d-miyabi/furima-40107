FactoryBot.define do
  factory :order do
    postal_code {111-1111}
    prefecture {東京都}
    city {杉並区}
    house_number {1-1}
    phone_number {11111111111}
  end
end