# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| first_name_kana       | string | null: false               |
| last_name_kana        | string | null: false               |
| birth_date            | date   | null: false               |

### Association

- has_many :item_infos
- has_many :purchase_records
- has_many :comments


## commentsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment         | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## item_infos テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_info          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| prefecture_from_id | integer    | null: false                    |
| deliver_date_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association    

- belongs_to :user
- has_one :purchase_record


##  purchase_records テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_info       | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item_info
- has_one :shipping_add


##  shipping_adds テーブル 

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_from_id | integer    | null: false                    |
| city               | string     | null: false                    |
| addresses          | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| purchase_record    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

