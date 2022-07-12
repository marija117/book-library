class Book < ApplicationRecord
  include Search
  belongs_to :author

  validates :title, presence: true
end
