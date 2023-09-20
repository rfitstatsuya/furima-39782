FactoryBot.define do
  factory :order_address do
    post_code            { '123-4567' }
    prefecture_id        { rand(2..48) }
    city                 { '富山市' }
    house_number         { '1-1' }
    building_name        { '東京ハイツ' }
    telephone_number     { Faker::Number.number(digits: 10) }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end
