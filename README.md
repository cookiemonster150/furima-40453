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
| name               | string | null: false |
| name_reading       | string | null: false |
| nickname           | string | null: false |

### Association

- has_many :items
- has_many :buyer

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| category           | text   | null: false |
| price              | integer| null: false |
| user_id            | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_many :buyer

##  addressesテーブル

| Column             | Type    | Options                       |
| ------------------ | ------  | ------------------------------|
| postal_code        | string  | null: false, foreign_key:true |
| prefecture         | integer | null: false, foreign_key:true |
| city               | string  | null: false, foreign_key:true |
| house_number       | string  | null: false, foreign_key:true |
| building_name      | string  | null: false, foreign_key:true |

### Association
has_one :buyer

## buyer テーブル

| Column             | Type       | Options                       |
| ------------------ | -----------| ------------------------------|
| item_id            | references | null: false, foreign_key:true |
| user_id            | references | null: false, foreign_key:true |
| addresses _id      | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :addresses


