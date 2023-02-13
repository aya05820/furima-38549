FactoryBot.define do
  factory :purchase_record do
    association :user
    association :item_info
  end
end