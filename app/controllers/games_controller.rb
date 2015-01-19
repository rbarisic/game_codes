class GamesController < ApplicationController

	def create

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

	end

	def destroy

	end
end	