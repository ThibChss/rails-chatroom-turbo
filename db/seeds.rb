# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Message.destroy_all
Chatroom.destroy_all
User.destroy_all

puts 'Creating Users 👷🏻‍♂️'
User.create(username: 'Thib', email: 'thib@gmail.com', password: 'password')
User.create(username: 'Nicky', email: 'nicky@alcool.com', password: 'password')

10.times do
  user = User.create(
    username: Faker::FunnyName.two_word_name,
    email: Faker::Internet.email,
    password: 'password'
  )
  puts "#{user.username} is born"
end
puts 'Done'

names_chatroom = [
  'Ça dit quoi ici !?',
  'Votre opinion de mes deux là',
  'A la cool',
  'Bien chill ici',
  'Mange tes mors',
  'Encore un anniv',
  'Weekend de malade',
  'NYE in NY',
  'Les penseurs',
  'Tié bieng',
  'Sup Bro',
  'WE Bourguignon',
  'Recettes de mam',
  'Cri du dragon',
  'C le S',
  "A m'en donné",
  'Toutafé',
  'Parle plus fort le J',
  'JM Apeupré',
  'La Vérité'
]

puts 'Creating Chatrooms 📧'

index = 0

20.times do
  user_first = User.all.sample
  user_second = User.all.sample
  name = names_chatroom[index]
  chatroom = Chatroom.create(
    name:,
    image_url: "background_#{rand(1..5)}"
  )
  puts "Creating Messages 📨 for the chatroom: #{chatroom.name}"
  25.times do
    Message.create(content: Faker::TvShows::Archer.quote, user: [user_first, user_second].sample, chatroom:)
  end
  index += 1
end
puts 'All done'
