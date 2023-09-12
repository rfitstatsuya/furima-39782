# テーブル設計

## users テーブル

| Column             | Type    | Options                                             |
| ------------------ | ------- | --------------------------------------------------- |
| nickname           | string  | null: false                                         |
| email              | string  | null: false, unique: true                           |
| password           | string  | null: false, format: {with: /\A[a-z0-9]+\z/i}       |
| encrypted_password | string  | null: false                                         |
| first_name         | string  | null: false, format: {with: /\A[ぁ-んァ-ン一-龥]/ } |
| last_name          | string  | null: false, format: {with: /\A[ぁ-んァ-ン一-龥]/ } |
| first_name_reading | string  | null: false, format: {with: /\A[ァ-ヶー－]+\z/ }    |
| last_name_reading  | string  | null: false, format: {with: /\A[ァ-ヶー－]+\z/ }    |
| birthday_year      | integer | null: false                                         |
| birthday_month     | integer | null: false                                         |
| birthday_date      | integer | null: false                                         |

### Association

- has_many :items
- has_many :orders
- has_many :addresses


## items テーブル

| Column          | Type       | Options                                        |
| --------------- | ---------- | ---------------------------------------------- |
| name            | string     | null: false                                    |
| explanation     | text       | null: false                                    |
| category        | integer    | null: false                                    |
| condition       | integer    | null: false                                    |
| derivery_cost   | integer    | null: false                                    |
| shipping_source | integer    | null: false                                    |
| sending_date    | integer    | null: false                                    |
| price           | integer    | null: false, format: {with: / \A [0-9]+ \z / } |
| user            | references | null: false, foreign_key: true                 |

### Association

- belongs_to :user
- has_one :order


## addresses テーブル

| Column           | Type       | Options                                          |
| ---------------- | ---------- | ------------------------------------------------ |
| post_code        | string     | null: false format: {with: /\A\d{3}[-]\d{4}\z/ } |
| prefecture       | string     | null: false                                      |
| city             | integer    | null: false                                      |
| house_number     | integer    | null: false                                      |
| building_name    | string     |                                                  |
| telephone_number | string     | null: false                                      |
| user             | references | null: false, foreign_key: true                   |
| order            | references | null: false, foreign_key: true                   |

### Association

- belongs_to :order
- belongs_to :user


## orders テーブル

| Column           | Type       | Options                                |
| ---------------- | ---------- | -------------------------------------- |
| user             | references | null: false, foreign_key: true         |
| item             | references | null: false, foreign_key: true         |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address
