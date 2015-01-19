# Create User
FactoryGirl.define do
	factory :user do
		nickname Faker::Internet.user_name
	end

# Create admin using User
#
#	factory :admin, class: User do
#		nickname 	'admin'
#		password 	'alpine'
#		admin		true
#   end
#

end