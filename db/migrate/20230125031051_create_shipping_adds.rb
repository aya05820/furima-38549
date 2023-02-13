class CreateShippingAdds < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_adds do |t|
      t.string :postal_code,           null: false
      t.integer :prefecture_from_id,   null: false
      t.string :city,                  null: false
      t.string :addresses,             null: false
      t.string :building
      t.string :phone_number,          null: false
      t.references :purchase_record,   null: false, foreign_key: true
      t.timestamps
    end
  end
end