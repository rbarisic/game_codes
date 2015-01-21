class GameCodesController < ApplicationController

	def new
		@gamecode = GameCode.new
	end

	def create
		@gamecode = GameCode.new
		@gamecode.user_id = current_user.id
		if @gamecode.save
			redirect_to @gamecode.game
		else
			render :new
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
	    	params.require(:game_code).permit(:code, :game_id, :user_id)
		end
end