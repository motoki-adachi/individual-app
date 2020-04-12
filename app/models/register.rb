class Register < ApplicationRecord
  validates :book_id, :genre_id, :user_id, :status, presence: true

  belongs_to :user, optional: true
  belongs_to :book, optional: true
  belongs_to :genre, optional: true

  def self.mounth_count(current_user_id, register_status)
    Register.where(user_id: current_user_id, status: register_status).group("YEAR(created_at)").group("MONTH(created_at)").count
  end

  
end
