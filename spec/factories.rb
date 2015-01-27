FactoryGirl.define do

	# Create User
	factory :user do
		nickname Faker::Internet.user_name
		password 'alpine123'
		email 'user@example.com'
	end

	# Create admin using User
	factory :admin, class: User do
		nickname 	'admin'
		password 	'alpine123'
		email		'admin@example.com'
		admin		true
   end

   	factory :game do
   		name Faker::App.name
   		creator Faker::App.author
   		code_length = 12
	end

	factory :game_code, class: GameCode do
		user
		game # associate with game
		game_id game
		user_id user
	end
end