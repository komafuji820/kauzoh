# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |

### Association

- has_many :group_users
- has_many :groups, through: :group_users

## groups テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :group_users
- has_many :users, through: :group_users
- has_many :items
- has_many :orders
- has_many :purchases

## group_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| group  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       |            |                                |
| memo        | string     |                                |
| group       | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |

### Association

- belongs_to :group
- belongs_to :category
- has_many :orders

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| memo        | string     |                                |
| group       | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |
| priority_id | integer    | null: false                    |

### Association

- belongs_to :group
- belongs_to :item
- belongs_to :category
- belongs_to :priority

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       |            |                                |
| memo        | string     |                                |
| group       | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |
| priority_id | integer    | null: false                    |

### Association

- belongs_to :group
- belongs_to :category
- belongs_to :priority