# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| nickname           | string | null: false |
| date_of_birth      | date   | null: false |

### Association

- has_many :items
- has_many :buyer

## items テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| item_name          | string    | null: false |
| description        | text      | null: false |
| detail             | string    |             |
| category_id        | integer   | null: false |
| condition_id       | integer   | null: false |
| delivery           | string    |             |
| postage_id         | integer   | null: false |
| from_id            | integer   | null: false |
| days_id            | date      | null: false |
| price              | integer   | null: false |
| user               | references| null: false,foreign_key:true |

### Association

- belongs_to :user
- has_one:buyer

##  addressesテーブル

| Column             | Type    | Options    |
| ------------------ | ------  | -----------|
| postal_code        | string  | null: false|
| prefecture_id      | integer | null: false|
| city               | string  | null: false|
| house_number       | string  | null: false|
| building_name      | string  |            |
| phone_number       | string  | null: false|
| buyer              | references | null: false, foreign_key:true |

### Association
belongs_to  :buyer

## buyers テーブル

| Column             | Type       | Options                       |
| ------------------ | -----------| ------------------------------|
| item               | references | null: false, foreign_key:true |
| user               | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses


