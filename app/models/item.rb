class Item < ApplicationRecord
  extend ActiveHash::Associations::ApplicationRecordExtensions
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_fee
  
  belongs_to :user

  has_one_attached :image

  validates :name, :item_explanation,  presence: true
  validates :image, presence: true
  

  validates :prefecture_id,     presence:true,   numericality: { other_than: 1 }
  validates :shipping_date_id,  presence:true,   numericality: { other_than: 1 }
  validates :status_id,         presence:true,   numericality: { other_than: 1 }
  validates :category_id,       presence:true,   numericality: { other_than: 1 }
  validates :deliveery_fee_id,  presence:true,   numericality: { other_than: 1 }

  VALID_PRICEL_REGEX = /\A[0-9]+\z/
  validates :price, presence: true, format: {with: VALID_PRICEL_REGEX}, 
             numericality: { only_integer: true,
              greater_than: 300, less_than: 9999999
            }  


  
end
