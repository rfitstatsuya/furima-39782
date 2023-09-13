# テーブル設計

## users テーブル

| Column             | Type    | Options                                             |
| ------------------ | ------- | --------------------------------------------------- |
| nickname           | string  | null: false                                         |
| email              | string  | null: false, unique: true                           |
| encrypted_password | string  | null: false                                         |
| first_name         | string  | null: false, format: {with: /\A[ぁ-んァ-ン一-龥]/ } |
| last_name          | string  | null: false, format: {with: /\A[ぁ-んァ-ン一-龥]/ } |
| first_name_reading | string  | null: false, format: {with: /\A[ァ-ヶー－]+\z∫/ }    |
| last_name_reading  | string  | null: false, format: {with: /\A[ァ-ヶー－]+\z/ }    |
| birthday           | date    | null: false                                         |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options                                        |
| ---------------- | ---------- | ---------------------------------------------- |
| name             | string     | null: false                                    |
| explanation      | text       | null: false                                    |
| category_id      | integer    | null: false                                    |
| condition_id     | integer    | null: false                                    |
| derivery_cost_id | integer    | null: false                                    |
| prefecture_id    | integer    | null: false                                    |
| sending_date_id  | integer    | null: false                                    |
| price            | integer    | null: false, format: {with: / \A [0-9]+ \z / } |
| user             | references | null: false, foreign_key: true                 |

### Association

- belongs_to :user
- has_one :order


## addresses テーブル

| Column           | Type       | Options                                          |
| ---------------- | ---------- | ------------------------------------------------ |
| post_code        | string     | null: false format: {with: /\A\d{3}[-]\d{4}\z/ } |
| prefecture_id    | integer    | null: false                                      |
| city             | string     | null: false                                      |
| house_number     | string     | null: false                                      |
| building_name    | string     |                                                  |
| telephone_number | string     | null: false                                      |
| order            | references | null: false, foreign_key: true                   |

### Association

- belongs_to :order


## orders テーブル

| Column           | Type       | Options                                |
| ---------------- | ---------- | -------------------------------------- |
| user             | references | null: false, foreign_key: true         |
| item             | references | null: false, foreign_key: true         |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address
