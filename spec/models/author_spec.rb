require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      author = Author.new().save
      expect(author).to eq(false)
    end

    it 'ensures name uniqueness' do
        author = Author.new(name: 'Leo Tolstoy').save
        author2 = Author.new(name: 'Leo Tolstoy').save
        expect(author2).to eq(false)
      end

    it 'should save successfully' do
      author = Author.new(name: 'Leo Tolstoy').save
      expect(author).to eq(true)
    end
  end
end