# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Club.destroy_all
puts "All clubs destroyed"

Competition.destroy_all
puts "All competitions destroyed"

Player.destroy_all
puts "All players destroyed"

Game.destroy_all
puts "All games destroyed"

User.destroy_all
puts "All users destroyed"

ReportsInstance.destroy_all
puts "All users destroyed"

Report.destroy_all
puts "All users destroyed"

user1 = User.create!(email: "user1@lewagon.com", password: 123456, first_name: "Pedro", last_name: "Romariz", birth_date: "1993-01-13", city: "Porto", phone_number: "00000123456789", role: "referee")
user2 = User.create!(email: "user2@lewagon.com", password: 123456, first_name: "Rui", last_name: "Morim", birth_date: "1989-01-13", city: "Porto", phone_number: "00000123456789", role: "organizer")
user3 = User.create!(email: "user3@lewagon.com", password: 123456, first_name: "Bernardo", last_name: "Mendes", birth_date: "2001-01-13", city: "Porto", phone_number: "00000123456789", role: "referee")

puts "Users created"

club1 = Club.create!(name: "Sport CLub do Porto", abreviation: "SCP", address: "Rua de Santa Catarina nº123", email: "sportclubdoporto@gmail.com", phone_number:"00000123456789")
club2 = Club.create!(name: "Associação Desportiva de Lousada", abreviation: "ADL", address: "Rua Rotunda de Lousada nº123", email: "adl@gmail.com", phone_number:"00000123456789")
club3 = Club.create!(name: "Casa Pia Atlético Clube", abreviation: "CPAC", address: "Rua do Mosteiro dos Jerónimos", email: "casapiaac@gmail.com", phone_number:"00000123456789")

puts "Clubs created"

player1 = Player.create!(first_name: "André", last_name: "Romariz", birth_date: "1994-03-23", gender: "male", club: club1)
player2 = Player.create!(first_name: "Miguel", last_name: "Romariz", birth_date: "1998-03-23", gender: "male", club: club1)
player3 = Player.create!(first_name: "José", last_name: "Silva", birth_date: "2001-03-23", gender: "male", club: club1)

puts "Players created"

competition1 = Competition.create!(name: "Liga NOS")

puts "Competitions created"

game_1 = Game.create!(competition: competition1, club_home: club1, club_away: club2, referee: user1, game_date: DateTime.now)

puts "Games created"
