FactoryBot.define do
  factory :item_info do
    item_name { 'トランポリン' }
    item_detail { '一人用です。5年前に購入しました。' }
    category_id        { 7 }
    status_id          { 2 }
    shipping_fee_id    { 2 }
    prefecture_from_id { 2 }
    deliver_date_id    { 2 }
    price              { 3000 }
    association :user

    after(:build) do |item_info|
      item_info.image.attach(io: File.open('app/assets/images/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end
