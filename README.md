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

# individual-app (AppName ： Memory Books)

* プログラミングスクール TECH::CAMP での学習期間中に作成した個人制作のアプリケーションです。

# 概要

* 読書が趣味の人をターゲットに、自分が読んだ本や買ったけど読めていない本(積読本)、欲しい本などを記録し管理するアプリケーションです。
* 登録した本ほグラフにして見える化することで、月に何冊読んだのか？どんなジャンルが多いのかなどを視覚的に把握することができます。
* 制作期間：約２週間


# リンク

http://13.114.232.15
* 上記リンクから下記のテストユーザーにてログインできます。

# テストユーザー

* ユーザーネーム: DEMO
* メールアドレス: demo@gmail.com
* パスワード: aaaaaa


# 主な使用技術

* ruby 2.5.1
* rails 5.2.4.1
* javascript
* JQuery
* BootStrap4
* chart.js
* twitter API
* mechanizeによるWebスクレイピング
* AWS EC2
* Haml
* Scss

# 実装内容紹介

* ユーザーのマイページ上でジャンル別・月別のグラフを作成し見える化しています。
* <img width="1440" alt="スクリーンショット 2020-03-24 20 09 16" src="https://user-images.githubusercontent.com/59963342/77419231-6c5dbe80-6e0b-11ea-86e8-f797bedaa9cf.png">


* 登録されていない本はユーザー側で、登録することが可能になっています。
* スクレイピングの技術を用いて登録時に作者名をインクリメンタルサーチで検索できるようになっています(日本の小説家で1,500人程)
* ![demo](https://gyazo.com/0c7a8a71c621e6b936ceb4709323ea4c/raw)

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
- has_many :book_genres

## publishersテーブル

|Column|Type|Options|
|------|----|-------|
|publisher|string|null: false|

### Association
- has_many :books


## book_genresテーブル
|Column|Type|Options|
|------|----|-------|
|book_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :book
- belongs_to :genre