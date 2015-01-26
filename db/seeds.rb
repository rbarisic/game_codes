# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#------------------------------------
# variables
#------------------------------------

game_names = "Spirols of Doom, Swords of Master, Fight of Fist, Anger of Dark, Presence of Evil, Absence of Darkness, Master of Legacy, Crime of War, Reason of Destiny, Sphere of Fire, Weapon of Fate, Melody of Wind".split(',')


#------------------------------------
# methods
#------------------------------------

def create_dummy_user
	User.create(nickname: Faker::Internet.user_name,
				email: Faker::Internet.email,
				password: 'Rosebud777',
				password_confirmation: 'Rosebud777',
				admin: false)
end

def create_game_code
	game = Game.find(1 + rand(Game.count - 1)) # find a random game in the valid id-range 

	GameCode.create(code: Faker::Number.number(game.code_length),
					game_id: game.id,
					user_id: (1 + rand(User.count - 1)))
end

def create_game(name)
	Game.create(name: name,
				creator: Faker::Company.name,
				company_url: 'http://www.' + Faker::Internet.domain_name,
				cover_url: 'http://www.google.com',
				code_length: 8 + rand(6),
				description: Faker::Lorem.paragraph(2))
end

#------------------------------------
# creation
#------------------------------------

# Create static admin account
User.create(nickname: 'admin',
			email: 'admin@example.com', 
			password: 'alpine123',
			password_confirmation: 'alpine123',
			admin: true)

# Create dummy users
50.times do 
	create_dummy_user
end

# Create a few mock games

game_names.each do |game_name|
	game = create_game(game_name)
end

100.times do
	create_game_code
end