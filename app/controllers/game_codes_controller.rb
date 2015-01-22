class GameCodesController < ApplicationController

	def new
		@gamecode = GameCode.new(code: params[:game_code][:code])
	end

	def create
		game = Game.find(params[:game_code][:game_id])
		
		@gamecode = GameCode.new(code_length: game.code_length)
		@gamecode.user_id = current_user.id
		@gamecode.update_attributes(gamecode_params)
		if @gamecode.save
			redirect_to @gamecode.game
		else
			render 'new'
		end
	end

	def index
		@gamecodes = GameCode.all
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def gamecode_params
	    	params.require(:game_code).permit(:code, :game_id, :user_id, :code_length)
		end
end