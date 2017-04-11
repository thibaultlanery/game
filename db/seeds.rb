# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
User.destroy_all


users = [

  {
    firstname: "Thibault",
    lastname: "Lanery",
    email: "thibaultlanery@gmail.com",
    password: "123456",
  },
  {
    firstname: "Anteo",
    lastname: "Guillot",
    email: "anteo737@hotmail.fr",
    password: "123456",
  },
  {
    firstname: "Julie",
    lastname: "Pesnel",
    email: "juliepesnel@gmail.com",
    password: "123456",
  },
  {
    firstname: "Antoine",
    lastname: "Veaux",
    email: "antoine.veaux@gmail.com ",
    password: "123456",
  },
  {
    firstname: "Benjamin",
    lastname: "Gahéry",
    email: "benjamingahery@gmail.com",
    password: "123456",
  },
  {
    firstname: "Julia",
    lastname: "Lissague",
    email: "julia.lissague@gmail.com",
    password: "123456",
  },
  {
    firstname: "Sibylle",
    lastname: "De Courcel",
    email: " sibylle44@gmail.com",
    password: "123456",
  }
]

users.each { |user| User.create!(user) }

events = [
  {
    game: "jungle",
    user: User.first,
    address: "5, rue Muller, 75018 paris",
    happen_at: DateTime.now + (18/24.0),
    due_at: DateTime.now + (14/24.0)
  },
    {
    game: "jeu de dé",
    user: User.first,
    address: "88, rue de la folie méricourt, 75011 paris",
    happen_at: DateTime.now + (24/24.0),
    due_at: DateTime.now + (18/24.0)
  },
   {
    game: "bixit",
    user: User.third,
    address: "88, passage bradi, 75011 paris",
    happen_at: DateTime.now + (48/24.0),
    due_at: DateTime.now + (32/24.0)
  },
   {
    game: "jeux de cochon",
    user: User.fourth,
    address: "46, avenue porte dauphine , 75016 paris",
    happen_at: DateTime.now + (168/24.0),
    due_at: DateTime.now + (72/24.0)
  },
   {
    game: "bridge",
    user: User.second,
    address: "46, avenue des champs élysées, 75016 paris",
    happen_at: DateTime.now + (5/24.0),
    due_at: DateTime.now + (4/24.0)
  },
   {
    game: "poker",
    user: User.all.sample,
    address: "46, impasse du cochonnet, 75019 paris",
    happen_at: DateTime.now + (5/24.0),
    due_at: DateTime.now + (4/24.0)
  },
   {
    game: "puissance 4",
    user: User.all.sample,
    address: "46, impasse du cochonnet, 75019 paris",
    happen_at: DateTime.now + (5/24.0),
    due_at: DateTime.now + (4/24.0)
  }
]


events.each { |event| Event.create!(event) }
