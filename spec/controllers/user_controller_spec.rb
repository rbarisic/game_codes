require 'rails_helper'

RSpec.describe UsersController do

	let(:user) { FactoryGirl.create(:user) }

	describe "without beeing logged in" do

		describe '#SHOW' do
			before { get :show, id: user.id }

			it "should redirect to user's page" do
				expect(response).to be_success
			end
		end

		describe '#INDEX' do
			before { get :index }

			it "should be forbidden & redirect to root path" do
				expect(response).not_to be_success
				expect(response).to redirect_to(root_path)
			end
		end

	end
end