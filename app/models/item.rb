class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :sender_address
  belongs_to :shipping_date
  belongs_to :shipping_fee

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :product_name, :price, :explanation, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :sender_address_id, :shipping_date_id, numericality: { other_than: 1 } 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字のみ入力できます' }
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
