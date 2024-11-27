FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    sender_address_id { 2 }
    city { '札幌市' }
    street_number { '中央区123番地' }
    postal_code { '123-4567' }
    telephone_number { '09012345678' }
    building_name { 'サッポロ' }
  end
end
