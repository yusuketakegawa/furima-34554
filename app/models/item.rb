class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
  validates :name
  validates :item_explanation
  validates :image
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}
  end

  with_options presence: true,   numericality: { other_than: 1 } do
  validates :prefecture_id
  validates :shipping_date_id
  validates :status_id
  validates :category_id
  validates :delivery_fee_id
  end

end
