class BuyShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :prefecture_id, :municipality, :building, :postal_code, :phone_number, :buy_id 

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :buy_id
    validates  :address
    validates  :municipality
    validates   :postal_code, {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates   :phone_number, {with: /\A\d{11}\z/}
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

    def save
      buy = Buy.create(user_id: user_id, item_id: item_id )

      Shipping.create(address: address, municipality: municipality, postal_code: postal_code, phone_number: phone_number,prefecture_id: prefecture_id, buy_id: buy_id )
    end
end