require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validation tests' do
    author = Author.new(name: 'Leo Tolstoy').save
    it 'ensures title presence' do
      book = Book.new(number_of_hard_copies: 2, author_id: 1).save
      expect(book).to eq(false)
    end

    it 'ensures number_of_hard_copies presence' do
      book = Book.new(title: 'Sidarta', author_id: 1).save
      expect(book).to eq(false)
    end

    it 'ensures valid number_of_hard_copies' do
        book = Book.new(title: 'Sidarta', number_of_hard_copies: "k", author_id: 1).save
        expect(book).to eq(false)
      end

    it 'ensures author_id presence' do
      book = Book.new(title: 'Sidarta', number_of_hard_copies: 2).save
      expect(book).to eq(false)
    end

    it 'should save successfully' do
      book = Book.new(title: 'Sidarta', number_of_hard_copies: 2, author_id: 1).save
      expect(book).to eq(true)
    end
  end
end