# テーブル設計

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| birthday         | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_record
- has_one :user_address

## user_addresses テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| family_name      | string     | null: false                   |
| first_name       | string     | null: false                   |
| family_name_kana | string     | null: false                   |
| first_name_kana  | string     | null: false                   |
| post_code        | string     | null: false                   |
| prefecture       | string     | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building_name    | string     | null: false                   |
| phone_number     | string     | null: false                   |
| user_id          | references | null: false foreign_key: true |

### Association

belongs_to :user
has_one :purchase_record

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| item_category    | string     | null: false                    |
| item_status      | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| delivery_days    | string     | null: false                    |
| item_price       | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
belong_to :user
has_one :purchase_record

## purchase_record テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |

### Association
belong_to :user
belong_to :address
belong_to :item