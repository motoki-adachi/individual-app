class Book < ApplicationRecord
  validates :title, uniqueness: true

  has_many :user_books
  has_many :users, through: :user_books
  belongs_to :genre
  has_many :registers
  # has_many :book_genres
  belongs_to :author
  belongs_to :publisher

  def self.search(search)
    return Book.all unless search
    Book.where('title LIKE(?)', "%#{search}%")
  end
end
