class Book < ApplicationRecord
  include Search
  belongs_to :author
  has_many :loan_records

  validates :title, presence: true
  validates :number_of_hard_copies, presence: true

  scope :out_of_stock, -> { where number_of_hard_copies: [0, nil]}
  scope :history_of_loaned_books, lambda { |user|
    joins(:loan_records).where("loan_records.user_id": user.id).order("loan_records.created_at": :asc) 
  }

end
