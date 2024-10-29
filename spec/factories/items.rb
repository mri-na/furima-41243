FactoryBot.define do
  factory :item do
    product_name { 'りんごの絵' }
    explanation { 'りんごの絵です。' }
    category_id {2}
    condition_id {2}
    shipping_fee_id {2}
    sender_address_id {2}
    shipping_date_id {2}
    price {3000}
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
