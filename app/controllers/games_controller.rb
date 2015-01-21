class GamesController < ApplicationController

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		if @game.save
			redirect_to @game
		else
			render :new
		end
	end

	def index
		@games = Game.all
	end

	def show
		@game = Game.friendly.find(params[:id])
		@gamecodes = @game.game_codes
	end

	def edit
		@game = Game.friendly.find(params[:id])
	end

	def update
		@game = Game.friendly.find(params[:id])
		if @game.update(game_params)
			flash[:success]
			redirect_to @game
		else
			render :edit
		end
	end

	def destroy

	end

	private
		def game_params
	      params.require(:game).permit(:name, :creator, :company_url, :cover_url)
	    end
end