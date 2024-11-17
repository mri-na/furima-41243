class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :sender_address_id, :city, :street_number, :building_name,
                :telephone_number

  with_options presence: true do
    validates :user_id, :item_id, :order_id, :sender_address_id, :city, :street_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上、11桁以内の半角数字でハイフンなしで入力してください' }
  end
  validates :building_name, presence: true, allow_blank: true
end

def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(order_id: order.id, postal_code: postal_code, sender_address_id: sender_address_id, city: city, street_number: street_number, building_name: building_name, telephone_number: telephone_number)
end
