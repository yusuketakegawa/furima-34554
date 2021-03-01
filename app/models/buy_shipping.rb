class BuyShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :prefecture_id, :municipality, :building, :postal_code, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates  :address
    validates  :municipality
    validates  :token
    validates  :prefecture_id,   numericality: { other_than: 1 }
    validates   :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates   :phone_number, format: { with: /\A\d{11}\z/ }
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)

    Shipping.create(address: address, municipality: municipality, postal_code: postal_code, phone_number: phone_number,
                    prefecture_id: prefecture_id, building: building, buy_id: buy.id)
  end
end
