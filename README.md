# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email    　　　　　   　| string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| first_name_kana       | string | null: false               |
| last_name_kana        | string | null: false               |
| birth_date            | date   | null: false               |


### Association

- has_many :item_info
- has_many :purchase_records
- has_many :comments


## commentsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment         | string     | null: false                    |
| user            | references | null: false, foreign_key: true |



### Association

- belongs_to :users


## item_info テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | text       | null: false                    |
| item_info       | text       | null: false                    |
| item_image      | image      | null: false                    |
| category        | string     | null: false, foreign_key: true |
| status          | string     | null: false, foreign_key: true |
| shipping_fee    | string     | null: false, foreign_key: true |
| prefecture_from | string     | null: false, foreign_key: true |
| deliver_date    | string     | null: false, foreign_key: true |
| price           | string     | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :users



##  purchase_records テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_info       | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item_info
- has_one :shipping_adds　



##  shipping_adds テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integar    | null: false                    |
| prefecture      | text       | null: false                    |
| city            | text       | null: false                    |
| building        | text       |                                |
| phone_number    | integar    | null: false, unique: true      |

### Association

- belongs_to :purchase_records 

