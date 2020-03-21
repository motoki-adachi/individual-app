class Register < ApplicationRecord
  validates :book_id, :genre_id, :user_id, presence: true

  belongs_to :user
  belongs_to :book
  belongs_to :genre
end
