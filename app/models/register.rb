class Register < ApplicationRecord
  validates :book_id, :genre_id, :user_id, :status, presence: true

  belongs_to :user, optional: true
  belongs_to :book, optional: true
  belongs_to :genre, optional: true

  def self.mounth_count(current_user_id, register_status)
    Register.where(user_id: current_user_id, status: register_status).group("YEAR(created_at)").group("MONTH(created_at)").count
  end

  def self.reading_books(current_user_id, register_status)
    Register.where(user_id: current_user_id, status: register_status).order("created_at DESC").limit(10)
  end

  def self.register_books(current_user_id)
    Register.where(user_id: current_user_id).order("created_at DESC")
  end

  def self.genre_count(current_user_id, register_status)
    Register.where(user_id: current_user_id, status: register_status).pluck(:genre_id).group_by(&:itself).transform_values(&:size).values
  end

  def self.genre_ids(current_user_id, register_status)
    Register.where(user_id: current_user_id, status: register_status).pluck(:genre_id).group_by(&:itself).keys
  end

end
