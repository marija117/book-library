# README

This README document steps are necessary to get the application up and running and explain implemented methods.

Things you may want to cover:

* Ruby version 
  ruby 2.7.6

* Rails version 
  Rails 7.0.3

* Database creation
  rails db:create

* Database initialization
  rails db:migrate
  rails db:seed

* How to run the test suite
  Example: bundle exec rspec ./spec/models/author_spec.rb

* Perform search for Authors
  Author.search("query")

* Perform search for Books
  Book.search("query")

* List of books which are currently out of stock
  Book.out_of_stock

* History of loaned books
  Book.history_of_loaned_books(user)

* Number of loaned books for specific member(to ensure member doesn't have more than three books on loan)
  LoanRecord.number_of_loaned_books(member_id)

* If nothing is specified default role for User is member

# book-library
