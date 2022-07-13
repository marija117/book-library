class LoanRecord < ApplicationRecord
  belongs_to :book
  belongs_to :user

  scope :number_of_loaned_books, -> (member_id) { (where user_id: member_id).count < 3}
  
  before_save do
    book = Book.find(self.book_id)
    book.number_of_hard_copies -= 1
    book.save!
  end
end
