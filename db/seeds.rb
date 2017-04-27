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
    game: "Jungle",
    user: User.first,
    address: "5, rue Muller, 75018, Paris, France",
    happen_at: Date.today + 2,
    due_at: Date.today + 1,
  },
    {
    game: "Jeu de dé",
    user: User.first,
    address: "88, rue de la folie méricourt, 75011, Paris, France",
    happen_at: Date.today + 7,
    due_at: Date.today + 5,
  },
   {
    game: "Bixit",
    user: User.third,
    address: "8, passage bradi, 75011, Paris, France",
    happen_at: Date.today + 5,
    due_at: Date.today + 3,
  },
   {
    game: "Jeux de cochon",
    user: User.fourth,
    address: "46, avenue porte dauphine , 75016, Paris, France",
    happen_at: Date.today + 6,
    due_at: Date.today + 5,
  },
   {
    game: "Bridge",
    user: User.second,
    address: "16, rue des Juifs, 50210, Cerisy la salle, France",
    happen_at: Date.today + 2,
    due_at: Date.today + 1,
  },
   {
    game: "Poker",
    user: User.all.sample,
    address: "29, rue diaz, 33000, Bordeaux, France",
    happen_at: Date.today + 4,
    due_at: Date.today + 3,
  },
   {
    game: "Puissance 4",
    user: User.all.sample,
    address: "46, impasse du cochonnet, 75019, Paris, France",
    happen_at: Date.today + 5,
    due_at: Date.today + 4,
  }
]


events.each { |event| Event.create!(event) }
