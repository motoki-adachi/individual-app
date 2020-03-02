class Genre < ApplicationRecord
  has_many :books
  # has_many :book_genres
  has_many :registers
end
