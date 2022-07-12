module Search
  extend ActiveSupport::Concern

  module ClassMethods
    def search(q)
      if self == Author
        Author.joins(:books).where("name LIKE :query", query: "%#{q.downcase}%").or(Author.joins(:books).where("books.title LIKE :query", query: "%#{q.downcase}%"))
      else
        Book.joins(:author).where("authors.name LIKE :query", query: "%#{q.downcase}%").or(Book.joins(:author).where("title LIKE :query", query: "%#{q.downcase}%"))
      end
    end
  end
end