FactoryBot.define do
  factory :item do
    name             {'ゴミ箱'}
    item_explanation {'いいね'}
    price            {'1000'}
    category_id      {'2'}
    status_id        {'2'}
    delivery_fee_id  {'2'}
    prefecture_id    {'2'}
    shipping_date_id   {'2'}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test.image.png'), filename: 'test.image.png')
    end
  end
end
