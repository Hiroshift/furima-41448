# README

# furimaのER図

## usersテーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_date         | date    | null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| shipping_fee    | integer    | null: false                    |
| shipping_origin | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user_id| references | null: false, foreign_key: true |
| item_id| references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shipping_information


## shipping_informationsテーブル

| Column         | Type    | Options     |
|----------------|---------|-------------|
| postal_code    | string  | null: false |
| prefecture     | integer | null: false |
| municipality   | string  | null: false |
| address_number | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |

### Association

- belongs_to :order

