class GameRequestsController < ApplicationController
	before_filter :authenticate_user!
	respond_to :js, :html

	def index
		@game_requests = GameRequest.find(:all)
	end

	def new
		@game_request = GameRequest.new
	end

	def create
		@game_request = GameRequest.find_by(request_params)
		
		if @game_request.nil?
			@game_request = GameRequest.new(request_params)
			if @game_request.save
				flash[:success] = 'LOL'
				redirect_to games_path
			else
		  		render 'new'
			end
		else
			if @game_request.requests < 30
				@game_request.requests += 1
				redirect_to game_request_path(@game_request)
			else
				@game_request.accepted = true
			end
		end

	end

	def show
		@game_request = GameRequest.find(params[:id])
	end

	def edit
		@game_request = GameRequest.find(params[:id])
	end

	def update
		@game_request = GameRequest.find(params[:id])
		if @game_request.update(update_request_params)
			flash[:success] = 'Request successfully updated.'
			redirect_to @game_request
		else
			render :edit
		end	
	end

	def destroy

	end

	def check_requests
		@game_requests = GameRequest.where(name: params[:name])
		if @game_requests.count > 0
			current_user.request_a_game
			respond_to do |format|
				format.js { @response = "Game already exists." }
			end
		else
			if current_user.requests_today >= 1
				GameRequest.create(name: params[:name])

				requests_left = current_user.requests_today

				current_user.update(requests_today: requests_left - 1)
				
				flash[:success] = "Post successfully created"
			else
				flash[:alert] = "Can't request games today anymore."
				render :new
			end
		end
	end

	private
		def request_params
			params.require(:game_request).permit(:name)
		end

		def update_request_params
			params.require(:game_request).permit(:name, :creator, :company_url, :cover_url, :code_length, :description)
		end
end