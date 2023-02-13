class ItemInfo < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :item_name,         presence: true
  validates :item_detail,       presence: true
  validates :category_id,             numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,               numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_from_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :deliver_date_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,   numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee
  belongs_to :deliverdate
  belongs_to :prefecture
end
