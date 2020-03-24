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
* ![6e849ffb22fd2fe74477f340e3b23e1b](https://user-images.githubusercontent.com/59963342/77434849-d46cce80-6e24-11ea-9708-b388b79ecb7d.gif)

* 登録されていない本はユーザー側で、登録することが可能になっています。
* 登録時に作者名をインクリメンタルサーチで検索できるようになっています(日本の小説家で1,500人程/スクレイピングを使用)
* ![demo](https://user-images.githubusercontent.com/59963342/77432352-49d6a000-6e21-11ea-9228-ba7be59d0df7.gif)

* 本の詳細ページにはTwitterAPIを使用して、本のタイトルに紐づくツイートを表示させています。。
* ![f50d81e53d7335ec5993b5d715337f8b](https://user-images.githubusercontent.com/59963342/77435249-6b398b00-6e25-11ea-9940-7531d290d7aa.gif)




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