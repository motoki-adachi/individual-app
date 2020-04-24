require 'rails_helper'

describe Book do
  describe '#create' do
    it "is invalid without a title" do
      book = build(:book, title: nil)
      book.valid?
      expect(book.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a author_id" do
      book = build(:book, author_id: nil)
      book.valid?
      expect(book.errors[:author_id]).to include("can't be blank")
    end

    it "is invalid without a genre_id" do
      book = build(:book, genre_id: nil)
      book.valid?
      expect(book.errors[:genre_id]).to include("can't be blank")
    end

    it "is invalid without a publisher_id" do
      book = build(:book, publisher_id: nil)
      book.valid?
      expect(book.errors[:publisher_id]).to include("can't be blank")
    end

    it "is valid with a title, author_id, genre_id, publisher_id" do
      book = build(:book)
      expect(book).to be_valid
    end

    it "is invalid with a duplicate title" do
      book = create(:book)
      another_book = build(:book)
      another_book.valid?
      expect(another_book.errors[:title]).to include("has already been taken")
    end
  end
end
