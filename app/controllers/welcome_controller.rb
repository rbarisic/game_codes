class WelcomeController < ApplicationController
  before_action :set_splash, only: [:index]

  def index
  end

  def help
  end

  def about
  end

  def imprint
  end

  private
  	def set_splash
  		@splash = true
  	end
end