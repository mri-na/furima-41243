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
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association
 - has_many :items
 - has_many :orders

## itemsテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| product_name   | string     | null: false                    |
| category       | string     | null: false                    |
| price          | integer    | null: false                    |
| image          | string     | null: false                    |
| shipping_fee   | string     | null: false                    |
| explanation    | text       | null: false                    |
| condition      | text       | null: false                    |
| sender_address | string     | null: false                    |
| shipping_date  | string     | null: false                    |

### Association
 - belongs_to :user
 - has_one :order
 - has_one :address

## ordersテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item

## addressesテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_id          | references | null: false, foreign_key: true |
| post_code        | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| street_number    | string     | null: false                    |
| telephone_number | integer    | null: false                    |

### Association
 - belongs_to :item
