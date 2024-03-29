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
- has_many :orders

## user_addresses テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| family_name      | string     | null: false                   |
| shipping_area_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building_name    | string     |                               |
| phone_number     | string     | null: false                   |
| order  | references | null: false foreign_key: true |

### Association

belongs_to :order

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| delivery_days_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
has_one :order

## orders テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :user_address
belongs_to :item