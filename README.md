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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, add_index :users, :email, unique: true|
|password|string|null: false|

### Association
- has_many :reviews
- has_many :books, through: :users_books
- has_many :users_books


## booksテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|author_id|string|null: false, foreign_key: true|

### Association
- belongs_to :author
- has_many :users, through: :users_books
- has_many :users_books


## authorsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|details|text||


### Association
- has_many :books


## users_booksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :book
- belongs_to :user


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|body|string||
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :book