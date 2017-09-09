# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

harry_potter = User.create({first_name: 'Harry', last_name: 'Potter', email: 'harry.potter@gmail.com', password: '11111111'})
severus_snape = User.create({first_name: 'Severus', last_name: 'Snape', email: 'severus.snape@gmail.com', password: '11111111'})
roland_deschain = User.create({first_name: 'Roland', last_name: 'Deschain', email: 'roland.deschain@gmail.com', password: '11111111'})

harry_potter.update(confirmed_at: Time.now)
severus_snape.update(confirmed_at: Time.now)
severus_snape.update(confirmed_at: Time.now)

rowling = Author.create({first_name: 'Joanne', last_name: 'Rowling'})
king = Author.create({first_name: 'Stephen', last_name: 'King'})

description = "In June XXXX, Bloomsbury published this book with an initial print run of 1,000 copies, 500 of which were distributed to libraries. "

Book.create([
    {
        author: rowling,
        user: harry_potter,
        title: "Harry Potter and the Philosopher's Stone",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: rowling,
        user: harry_potter,
        title: "Harry Potter and the Chamber of Secrets",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: rowling,
        user: harry_potter,
        title: "Harry Potter and the Prisoner of Azkaban",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: rowling,
        user: severus_snape,
        title: "Harry Potter and the Goblet of Fire",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: rowling,
        user: severus_snape,
        title: "Harry Potter and the Order of the Phoenix",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: rowling,
        user: severus_snape,
        title: "Harry Potter and the Half-Blood Prince",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: rowling,
        user: severus_snape,
        title: "Harry Potter and the Deathly Hallows",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: king,
        user: roland_deschain,
        title: "Misery",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: king,
        user: roland_deschain,
        title: "Four Past Midnight",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: king,
        user: roland_deschain,
        title: "Duma Key",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: king,
        user: roland_deschain,
        title: "The Green Mile",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: king,
        user: roland_deschain,
        title: "Just After Sunset",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: king,
        user: roland_deschain,
        title: "Black House",
        description: description,
        category: :fiction,
        status: :available
    },
    {
        author: king,
        user: roland_deschain,
        title: "The Man in the Black Suit",
        description: description,
        category: :fiction,
        status: :available
    },
])