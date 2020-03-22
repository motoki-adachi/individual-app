require 'rails_helper'

describe Register do
  describe '#create' do

    it "is invalid without a book_id" do
      register = build(:register , book_id: nil)
      register.valid?
      expect(register.errors[:book_id]).to include("can't be blank")
    end

    it "is invalid without a genre_id" do
      register = build(:register, genre_id: nil)
      register.valid?
      expect(register.errors[:genre_id]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      register = build(:register, user_id: nil)
      register.valid?
      expect(register.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a status" do
      register = build(:register, status: nil)
      register.valid?
      expect(register.errors[:status]).to include("can't be blank")
    end

    it "is valid with a book_id, genre_id, user_id, status" do
      register = build(:register)
      expect(register).to be_valid
    end

  end
end