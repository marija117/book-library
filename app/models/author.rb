class Author < ApplicationRecord
    include Search
    has_many :books, dependent: :destroy

    validates :name, presence: true, uniqueness: true
end
