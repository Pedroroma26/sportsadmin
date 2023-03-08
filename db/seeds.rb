# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'uri'


ReportsInstance.destroy_all
puts "All users destroyed"

Report.destroy_all
puts "All users destroyed"

Competition.destroy_all
puts "All competitions destroyed"

Club.destroy_all
puts "All clubs destroyed"

Player.destroy_all
puts "All players destroyed"

Game.destroy_all
puts "All games destroyed"

User.destroy_all
puts "All users destroyed"

user1 = User.create!(email: "user1@lewagon.com", password: 123456, first_name: "Pedro", last_name: "Romariz", birth_date: "1993-01-13", city: "Porto", phone_number: "00000123456789", role: "referee")
user2 = User.create!(email: "user2@lewagon.com", password: 123456, first_name: "Rui", last_name: "Morim", birth_date: "1989-01-13", city: "Porto", phone_number: "00000123456789", role: "organizer")
user3 = User.create!(email: "user3@lewagon.com", password: 123456, first_name: "Bernardo", last_name: "Mendes", birth_date: "2001-01-13", city: "Porto", phone_number: "00000123456789", role: "referee")
puts "Users created"

# clubs seeds

#adlousada
club1 = Club.new(name: "Associação Desportiva de Lousada", abbreviation: "ADL", address: "Estádio Municipal de Lousada", email: "email@email.lw", phone_number:"(+351) 192 837 465")
#adlousada image
file = URI.open("https://res.cloudinary.com/diey6169r/image/upload/v1678274596/Sports%20Admin/adlousada_rnkmnx.png")
club1.photo.attach(io: file, filename: "adlousada.png", content_type: "image/png")
club1.save
puts "club1 created"

# acasapia
club2 = Club.new(name: "Casa Pia Atlético Clube", abbreviation: "CPAC", address: "Estádio Pina Manique", email: "email@email.lw", phone_number:"(+351) 276 398 541")
# acasapia image
file = URI.open("https://res.cloudinary.com/diey6169r/image/upload/v1678273993/Sports%20Admin/casapiaac_eadqir.png")
club2.photo.attach(io: file, filename: "casapiaac.png", content_type: "image/png")
club2.save
puts "club2 created"

# cfbenfica
club3 = Club.new(name: "Clube Futebol Benfica", abbreviation: "CFB", address: "Estádio Francisco Lázaro", email: "email@email.lw", phone_number: "(+351) 145 893 672")
# cfbenfica image
file = URI.open("https://res.cloudinary.com/diey6169r/image/upload/v1678273994/Sports%20Admin/clubefutebolbenfica.svg_oe6s4v.png")
club3.photo.attach(io: file, filename: "clubefutebolbenfica.svg.png", content_type: "image/png")
club3.save
puts "club3 created"

# cfuniaodelamas
club4 = Club.new(name: "Clube Futebol União de Lamas", abbreviation: "CFUL", address: "Estádio Comendador Henrique Amorim", email: "email@email.lw", phone_number: "(+351) 975 318 642")
# cfuniaodelamas image
file = URI.open("https://res.cloudinary.com/diey6169r/image/upload/v1678280744/Sports%20Admin/clubefuteboluniaodelamas_qljgcl.png")
club4.photo.attach(io: file, filename: "clubefuteboluniaodelamas.png", content_type: "image/png")
club4.save
puts "club4 created"

# gdviso
club5 = Club.new(name: "Grupo Desportivo do Viso", abbreviation: "GDV", address: "Pavilhão Grupo Desportivo Viso", email: "email@email.lw", phone_number: "(+351) 246 813 579")
# gdviso image
file = URI.open("https://res.cloudinary.com/diey6169r/image/upload/v1678273994/Sports%20Admin/grupodesportivodoviso_hprmsh.png")
club5.photo.attach(io: file, filename: "grupodesportivodoviso.png", content_type: "image/png")
club5.save
puts "club5 created"

# juventudehoqueiclube
club6 = Club.new(name: "Juventude Hóquei Clube", abbreviation: "JHC", address: "Estádio Municipal de Hóquei em Campo", email: "email@email.lw", phone_number: "(+351) 987 654 321")
#juventudehoqueiclube image
file = URI.open("https://res.cloudinary.com/diey6169r/image/upload/v1678273994/Sports%20Admin/juventudehoqueiclube_tsneqp.png")
club6.photo.attach(io: file, filename: "juventudehoqueiclube.png", content_type: "image/png")
club6.save
puts "club6 created"

# lisboncasuals
club7 = Club.new(name: "Lisbon Casuals Hockey Club", abbreviation: "LCHC", address: "Centro Desportivo Nacional do Jamor", email: "email@email.lw", phone_number: "(+351) 123 456 789")
# lisboncasuals image
file = URI.open("https://res.cloudinary.com/diey6169r/image/upload/v1678273994/Sports%20Admin/juventudehoqueiclube_tsneqp.png")
club7.photo.attach(io: file, filename: "lisboncasuals.png", content_type: "image/png")
club7.save
puts "club7 created"


player1 = Player.create!(first_name: "André", last_name: "Romariz", player_number: 1, birth_date: "1994-03-23", gender: "male", club: club1)
player2 = Player.create!(first_name: "Miguel", last_name: "Romariz", player_number: 7, birth_date: "1998-03-23", gender: "male", club: club1)
player3 = Player.create!(first_name: "José", last_name: "Silva", birth_date: "2001-03-23", player_number: 12, gender: "male", club: club3)
puts "Players created"

competition1 = Competition.create!(name: "Campeonato Nacional de Hóquei em Campo")
puts "Competition created"

game1 = Game.create!(competition: competition1, club_home: club1, club_away: club2, referee: user1, game_date: DateTime.now)
game2 = Game.create!(competition: competition1, club_home: club3, club_away: club2, referee: user3, game_date: DateTime.now + 1)
puts "Games created"

report1 = Report.create!(game: game1, referee_validation: true)
puts "Report1 created"

report_instance1_1 = ReportsInstance.create!(category: "Goal", minute: 8, motive: "", report: report1, player: player1)
report_instance1_2 = ReportsInstance.create!(category: "Own-Goal", minute: 15, motive: "", report: report1, player: player1)
report_instance1_3 = ReportsInstance.create!(category: "Green-Card", minute: 17, motive: "", report: report1, player: player1)
report_instance1_4 = ReportsInstance.create!(category: "Yellow-Card", minute: 32, motive: "", report: report1, player: player1)
report_instance1_5 = ReportsInstance.create!(category: "Red-Card", minute: 40, motive: "", report: report1, player: player1)
report_instance1_6 = ReportsInstance.create!(category: "Sub-In", minute: 10, motive: "", report: report1, player: player1)
report_instance1_7 = ReportsInstance.create!(category: "Sub-Out", minute: 9, motive: "", report: report1, player: player1)
report_instance1_8 = ReportsInstance.create!(category: "Other", minute: 45, motive: "", report: report1, player: player1)
report_instance1_9 = ReportsInstance.create!(category: "Other", minute: "", motive: "Claques andaram à porrada", report: report1, player: player1)
puts "Instances created"
