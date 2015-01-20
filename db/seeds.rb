def create_dummy_user
	User.create(nickname: Faker::Internet.user_name,
				email: Faker::Internet.email,
				password: 'Rosebud777',
				password_confirmation: 'Rosebud777',
				admin: false)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create static admin account
User.create(nickname: 'xiq',
			email: 'xiqxiq@rocketmail.com', 
			password: 'alpine123',
			password_confirmation: 'alpine123',
			admin: true)

# Create dummy users
50.times do 
	create_dummy_user
end

# Create a few mock games
games = "Swords of Master, Fight of Fist, Anger of Dark, Presence of Evil, Absence of Darkness, Master of Legacy".split(',')
games.each do |game|
	Game.create(name: game, creator: Faker::Company.name)
end