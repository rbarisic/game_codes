class GamesController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]
	before_filter :verify_admin, except: [:index, :show]

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		if @game.save
			redirect_to @game
		else
			render 'new'
		end
	end

	def index
		@game_code = GameCode.new
		@games = Game.all.paginate(page: params[:page], per_page: 8)
		@view = params[:view]
	end

	def show
		@game = Game.friendly.find(params[:id])
		@game_code = GameCode.new(game_id: @game.id)
		@gamecodes = @game.game_codes.paginate(page: params[:page], per_page: 20)
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

	def get_code_length
		@game = Game.find(params[:id])
		render text: "#{@game.id}"
	end

	private
		def game_params
	      params.require(:game).permit(:name, :creator, :company_url, :code_length, :cover_url, :description)
	    end

	    def verify_admin
	    	redirect_to(root_path) unless current_user_is_admin
	    end
end