class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author_id, :genre_id, :publisher_id, presence: true

  has_many :user_books
  has_many :users, through: :user_books
  has_many :registers

  belongs_to :genre, optional: true
  belongs_to :author, optional: true
  belongs_to :publisher, optional: true

  def self.search(search)
    return Book.all unless search

    Book.where('title LIKE(?)', "%#{search}%")
  end
end
