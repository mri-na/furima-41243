## usersテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_day          | date    | null: false |

### Association
 - has_many :orders

## itemsテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| product_name      | string     | null: false                    |
| category_id       | integer    | null: false                    |
| price             | integer    | null: false                    |
| shipping_fee_id   | integer    | null: false                    |
| explanation       | text       | null: false                    |
| condition_id      | integer    | null: false                    |
| sender_address_id | integer    | null: false                    |
| shipping_date_id  | integer    | null: false                    |

### Association
 - has_one :order
 - has_one :address

## ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item
 - has_one :address

## addressesテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item              | references | null: false, foreign_key: true |
| order             | references | null: false, foreign_key: true |
| post_code         | string     | null: false                    |
| sender_address_id | integer    | null: false                    |
| city              | string     | null: false                    |
| street_number     | string     | null: false                    |
| building_name     | string     | null: false                    |
| telephone_number  | string     | null: false                    |

### Association
 - belongs_to :item
 - belongs_to :order
