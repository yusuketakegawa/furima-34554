class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to :user

  has_one_attached :image

  validates :name, presence: true
  validates :item_explanation, presence: true
  validates :image, presence: true
  

  validates :prefecture_id,     presence: true,   numericality: { other_than: 1 }
  validates :shipping_date_id,  presence: true,   numericality: { other_than: 1 }
  validates :status_id,         presence: true,   numericality: { other_than: 1 }
  validates :category_id,       presence: true,   numericality: { other_than: 1 }
  validates :delivery_fee_id, presence: true,  numericality: { other_than: 1 }


  validates :price, presence: true
  validates :price, format: {with: /\A[0-9]+\z/}
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}
end
