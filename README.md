# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## user_addresses テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| family_name      | string     | null: false                   |
| prefecture_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building_name    | string     | null: false                   |
| phone_number     | string     |                               |
| purchase_record  | references | null: false foreign_key: true |

### Association

belongs_to :user
has_one :purchase_record

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_description    | text       | null: false                    |
| item_category_id    | integer    | null: false                    |
| item_status_id      | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| delivery_days_id    | integer    | null: false                    |
| item_price          | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
belongs_to :purchase_record

## purchase_records テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :address
belongs_to :item