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
    address: "1, Avenue des Champs Elysées, 75008, Paris ",
    gender: "male",
    age: 30,
  },
  {
    firstname: "Anteo",
    lastname: "Guillot",
    email: "anteo737@hotmail.fr",
    password: "123456",
    address: "157 cours Balguerie Stuttenberg, 33000, Bordeaux",
    gender: "male",
    age: 21,
  },
  {
    firstname: "Julie",
    lastname: "Pesnel",
    email: "juliepesnel@gmail.com",
    password: "123456",
    address: "5, rue Muller, 75018, Paris",
    gender: "female",
    age: 37,
  },
  {
    firstname: "Antoine",
    lastname: "Veaux",
    email: "antoine.veaux@gmail.com ",
    password: "123456",
    address: "29, rue Diaz, 33000, Bordeaux",
    gender: "male",
    age: 29,
  },
  {
    firstname: "Benjamin",
    lastname: "Gahéry",
    email: "benjamingahery@gmail.com",
    password: "123456",
    gender: "male",
    age: 28,
  },
  {
    firstname: "Julia",
    lastname: "Lissague",
    email: "julia.lissague@gmail.com",
    password: "123456",
    gender: "female",
    age: 30,
  },
  {
    firstname: "Sibylle",
    lastname: "De Courcel",
    email: " sibylle44@gmail.com",
    password: "123456",
    gender: "female",
    age: 34,
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
    description: "Venez Jouer a Jungle les amis c'est si rigolo!",
  },
    {
    game: "Jeu de dé",
    user: User.first,
    address: "88, rue de la folie méricourt, 75011, Paris, France",
    happen_at: Date.today + 7,
    due_at: Date.today + 5,
    description: "On reprends les memes et on recommence?? un bon vieux jeux de dés!",
  },
   {
    game: "Bixit",
    user: User.third,
    address: "8, passage bradi, 75011, Paris, France",
    happen_at: Date.today + 5,
    due_at: Date.today + 3,
    description: "Pas besoin de te faire un dessin, on est deux on a besoin de 2 buddies!",
  },
   {
    game: "Jeux de cochon",
    user: User.fourth,
    address: "46, avenue porte dauphine , 75016, Paris, France",
    happen_at: Date.today + 6,
    due_at: Date.today + 5,
    description: "Avec mon petit on souhaiterai jouer au jeux de cochons! on a fait un gateau",
  },
   {
    game: "Bridge",
    user: User.second,
    address: "16, rue des Juifs, 50210, Cerisy la salle, France",
    happen_at: Date.today + 2,
    due_at: Date.today + 1,
    description: "Amateurs s'abstenir on est chaud du bridge!",
  },
   {
    game: "Poker",
    user: User.all.sample,
    address: "29, rue diaz, 33000, Bordeaux, France",
    happen_at: Date.today + 4,
    due_at: Date.today + 3,
    description: "Poker Texas Hold'hem besoin de 3 joueurs!",
  },
   {
    game: "Puissance 4",
    user: User.all.sample,
    address: "46, impasse du cochonnet, 75019, Paris, France",
    happen_at: Date.today + 5,
    due_at: Date.today + 4,
    description: "Je suis tout seul on peut se faire un puissance 4 après j'ai d'autres jeux",
  }
]


events.each { |event| Event.create!(event) }


