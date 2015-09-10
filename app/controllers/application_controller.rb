class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :nickname
	  devise_parameter_sanitizer.for(:sign_up) << :avatar
	  devise_parameter_sanitizer.for(:sign_up) << :community_terms
	end

	def current_user_is_admin
		true if current_user.admin == 't'
	end
end