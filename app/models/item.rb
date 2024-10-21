class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :sender_address, :shipping_date, :shipping_fee
  
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :product_name, :price, :explanation, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :sender_address_id, :shipping_date_id, numericality: { other_than: 1 } 
end
