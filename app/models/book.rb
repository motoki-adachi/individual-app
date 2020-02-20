class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books
  has_many :genres, through: :book_genres
  has_many :book_genres
  belongs_to :author
  belongs_to :publisher
end