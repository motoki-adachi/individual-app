class Register < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :genre
end
