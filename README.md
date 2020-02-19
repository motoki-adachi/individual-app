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
|author_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|
|publisher_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :author
- belongs_to :publisher
- has_many :users, through: :users_books
- has_many :users_books
- has_many :genres, through: :book_genres
- has_many :book_genres




## authorsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|details|text||


### Association
- has_many :books


## user_booksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|book_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :book
- belongs_to :user
- has_many :reviews


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|user_id|integer|null: false, foreign_key: true|
|book_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :book


## genresテーブル

|Column|Type|Options|
|------|----|-------|
|genre|string|null: false|

### Association
- has_many :books
- has.many :book_genres

## publishersテーブル

|Column|Type|Options|
|------|----|-------|
|publisher|string|null: false|

### Association
- has_many :book


## book_genresテーブル
|Column|Type|Options|
|------|----|-------|
|book_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :book
- belongs_to :genre