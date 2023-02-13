class OrderPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_from_id, :city, :addresses, :building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_from_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, length: { minimum: 10, maximum: 11 }, format: { with: /\A[0-9]+\z/, message: 'is invalid.' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_info_id: item_id)
    ShippingAdd.create(postal_code: postal_code, prefecture_from_id: prefecture_from_id, city: city, addresses: addresses,
                       building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
