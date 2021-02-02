## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| famiry_kana        | string     | null: false                    |
| first_kana         | string     | null: false                    |
| birthday           | date       | null: false                    |
| email              | string     | null: false, foreign_key: true |
| encrypted_password | string     | null: false                    |

### Association

- has_many :items
- has_many :buys

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| carriage_id        | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| schedule_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buysテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false  foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :distribution

## distributionsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| item               | references | null: false, foreign_key: true |

- belongs_to :buy