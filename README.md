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
| price              | string     | null: false                    |
| item_text          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition          | string     | null: false                    |
| carriage           | string     | null: false                    |
| item_prefecture    | string     | null: false                    |
| scheduled_delivery | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buys

## buyテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false  foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :distribution

## distributionテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| user_prefecture    | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| phone_number       | string     | null: false                    |
| item               | references | null: false, foreign_key: true |

- belongs_to :buy_id