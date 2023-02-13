class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item_info
  has_one :shipping_add
end
