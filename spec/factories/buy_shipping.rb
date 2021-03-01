FactoryBot.define do
  factory :buy_shipping do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    address { '大阪府' }
    municipality { '1-1' }
    building { '大阪ハイツ' }
    phone_number { 98_012_345_678 }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id {6}
    item_id {10}
  end
end
