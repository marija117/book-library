class Book < ApplicationRecord
  include Search
  belongs_to :author

  validates :title, presence: true
  validates :number_of_hard_copies, presence: true

  scope :out_of_stock, -> { where number_of_hard_copies: [0, nil]}
end
