# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(nickname: 'xiq', email: 'xiqxiq@rocketmail.com', password: 'alpine123', password_confirmation: 'alpine123', admin: true)

games = "Swords of Master, Fight of Fist, Anger of Dark, Presence of Evil, Absence of Darkness, Master of Legacy".split(',')
games.each do |game|
	Game.create(name: game)
end