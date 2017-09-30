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

academ_colour_prospect_lat = 54.8369606
academ_colour_prospect_lng = 83.0975356
harry_potter.update(confirmed_at: Time.now, lat: academ_colour_prospect_lat, lng: academ_colour_prospect_lng)

berdsk_colour_prospect_lat = 54.7572081
berdsk_colour_prospect_lng = 83.103093
severus_snape.update(confirmed_at: Time.now, lat: berdsk_colour_prospect_lat, lng: berdsk_colour_prospect_lng)

novosibirsk_colour_prospect_lat = 55.0224099
novosibirsk_colour_prospect_lng = 82.9544365
roland_deschain.update(confirmed_at: Time.now, lat: novosibirsk_colour_prospect_lat, lng: novosibirsk_colour_prospect_lng)

rowling = 'Joanne Rowling'
king = 'Stephen King'

description = "In June XXXX, Bloomsbury published this book with an initial print run of 1,000 copies, 500 of which were distributed to libraries."


Book.create([
    {
        author_name: rowling,
        user: harry_potter,
        title: "Harry Potter and the Philosopher's Stone",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'http://i.imgur.com/2yLSXoj.jpg'),
    },
    {
        author_name: rowling,
        user: harry_potter,
        title: "Harry Potter and the Chamber of Secrets",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'http://ll-c.ooyala.com/e1/o1bm52YjE6f-SbSzb4BsKjBfwVxrgbBX/promo324073602'),
    },
    {
        author_name: rowling,
        user: harry_potter,
        title: "Harry Potter and the Prisoner of Azkaban",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'http://ll-c.ooyala.com/e1/o3bm52YjE6T1WKbX7_fpnd43A7W9TlP8/promo324073888'),
    },
    {
        author_name: rowling,
        user: severus_snape,
        title: "Harry Potter and the Goblet of Fire",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'https://i.ytimg.com/vi/s3LA6Mc-4_0/maxresdefault.jpg'),
    },
    {
        author_name: rowling,
        user: severus_snape,
        title: "Harry Potter and the Order of the Phoenix",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'https://www.warnerbros.com/sites/default/files/styles/wb_hero_banner/public/harry_potter_order_phoenix_hero1_0.jpg?itok=IBOAW1p7'),
    },
    {
        author_name: rowling,
        user: severus_snape,
        title: "Harry Potter and the Half-Blood Prince",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'http://ll-c.ooyala.com/e1/o5bm52YjE6N1KYE12vNmm7Zw4TWNzMew/promo324074177'),
    },
    {
        author_name: rowling,
        user: severus_snape,
        title: "Harry Potter and the Deathly Hallows",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'http://ll-c.ooyala.com/e1/V2anJsbzrlkRCbzM0DlCpDlJ396P5sOh/promo324074765'),
    },
    {
        author_name: king,
        user: roland_deschain,
        title: "Misery",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'https://d2ycltig8jwwee.cloudfront.net/articles/4325/detail.34627e6f.jpg'),
    },
    {
        author_name: king,
        user: roland_deschain,
        title: "Four Past Midnight",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'https://altwall.net/img/albums/b5899b02601621eb28e993525a52ca99_2011.jpg'),
    },
    {
        author_name: king,
        user: roland_deschain,
        title: "Duma Key",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'https://s-media-cache-ak0.pinimg.com/originals/70/43/ff/7043ff38c75b7a3d22650c5fda3ac098.jpg'),
    },
    {
        author_name: king,
        user: roland_deschain,
        title: "The Green Mile",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'https://a.ltrbxd.com/resized/sm/upload/1x/yu/fy/j3/the-green-mile-1200-1200-675-675-crop-000000.jpg?k=c9fbc02bb0'),
    },
    {
        author_name: king,
        user: roland_deschain,
        title: "Just After Sunset",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'http://gogirlcafe.jennyo.net/wp-content/uploads/2009/01/11.jpg'),
    },
    {
        author_name: king,
        user: roland_deschain,
        title: "Black House",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'https://s-media-cache-ak0.pinimg.com/originals/93/d4/ca/93d4ca160ef38409d3896da7bc781678.jpg'),
    },
    {
        author_name: king,
        user: roland_deschain,
        title: "The Man in the Black Suit",
        description: description,
        category: :fiction,
        status: :available,
        image: Image.new(remote_file_url: 'https://img.labirint.ru/images/comments_pic/1551/5_dd7dce91522ebdc0ee9dd8c14c2901fc_1450167190.jpg'),
    },
])