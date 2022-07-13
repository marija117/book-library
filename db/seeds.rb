# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
    {
        full_name: "John Doe",
        email: "john@doe.com",
        password: "12345678",
        password_confirmation: "12345678",
        role: "librarian"
    },
    {
        full_name: "Joe Smith",
        email: "joe@amith.com",
        password: "12345678",
        password_confirmation: "12345678"
    },
    {
        full_name: "Jane Doe",
        email: "jane@doe.com",
        password: "12345678",
        password_confirmation: "12345678"
    },
    {
        full_name: "Anna Smith",
        email: "anna@smith.com",
        password: "12345678",
        password_confirmation: "12345678"
    }
])

Author.create([
    {
        name: "Hermann Hesse"
    },
    {
        name: "Kazuo Ishiguro"
    },
    {
        name: "Leo Tolstoy"
    }
])


Book.create([
    {
        title: "Sidarta",
        number_of_hard_copies: 5,
        author_id: 1
    },
    {
        title: "Demian",
        number_of_hard_copies: 5,
        author_id: 1
    },
    {
        title: "Steppenwolf",
        number_of_hard_copies: 2,
        author_id: 1
    },
    {
        title: "Never let me go",
        number_of_hard_copies: 5,
        author_id: 2
    },
    {
        title: "Klara and the Sun",
        number_of_hard_copies: 2,
        author_id: 2
    },
    {
        title: "War and Peace",
        number_of_hard_copies: 10,
        author_id: 3
    },
    {
        title: "Anna Karenina",
        number_of_hard_copies: 8,
        author_id: 3
    },
    {
        title: "The Death of Ivan Ilyich",
        number_of_hard_copies: 3,
        author_id: 3
    }
])

LoanRecord.create([
    {
        user_id: "2",
        book_id: "1"
    },
    {
        user_id: "2",
        book_id: "3"
    },
    {
        user_id: "2",
        book_id: "6"
    },
    {
        user_id: "3",
        book_id: "2"
    },
    {
        user_id: "3",
        book_id: "3"
    },
    {
        user_id: "3",
        book_id: "7"
    }
])
