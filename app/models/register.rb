class Register < ApplicationRecord
  validates :book_id, :genre_id, :user_id, :status, presence: true

  belongs_to :user, optional: true
  belongs_to :book, optional: true
  belongs_to :genre, optional: true
end
