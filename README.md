## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | integer    | null: false                    |
| nickname           | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| famiry_kana        | string     | null: false                    |
| first_kana         | string     | null: false                    |
| birthday           | date       | null: false                    |
| email              | string     | null: false                    |
| password           | string     | null: false                    |

### Association

- has_many :items
- has_many :buy

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_id            | integer    | null: false                    |
| name               | string     | null: false                    |
| price              | string     | null: false                    |
| image              | string     | null: false                    |
| item_text          | text       | null: false                    |
| category           | string     | null: false                    |
| carriage           | string     | null: false                    |
| item_prefecture    | string     | null: false                    |
| scheduled_delivery | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buyテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| buy_id             | integer    | null: false                    |
| credit_card        | integer    | null: false                    |
| item_id            | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :distribution

## distributionテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| user_prefecture    | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| phone_number       | integer    | null: false                    |
| item_id            | references | null: false, foreign_key: true |

- belongs_to :buy_id