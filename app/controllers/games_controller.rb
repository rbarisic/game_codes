class GamesController < ApplicationController

	def new

	end

	def create
		redirect_to @game
	end

	def index
		@games = Game.all
	end

	def show
		@game = Game.friendly.find(params[:id])
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
	      params.require(:game).permit(:name, :creator)
	    end
end	

