class WelcomeController < ApplicationController
  before_action :set_splash, only: [:index]

  def index
    @gamecode = GameCode.new
  end

  def help
  end

  def about
  end

  def imprint
  end

  def terms
    #ToC - Terms of the Community
  end

  private
  	def set_splash
  		@splash = true
  	end
end