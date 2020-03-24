class Genre < ApplicationRecord
  has_many :books
  has_many :registers
end
