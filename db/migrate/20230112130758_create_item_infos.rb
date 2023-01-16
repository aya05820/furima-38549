class CreateItemInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :item_infos do |t|
      t.string :item_name, null: false
      t.text   :item_detail, null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :shipping_fee_id,     null: false
      t.integer :prefecture_from_id,  null: false
      t.integer :deliver_date_id,     null: false
      t.integer  :price,              null: false
      t.references :user              null: false, foreign_key: true
      t.timestamps
    end
  end
end
