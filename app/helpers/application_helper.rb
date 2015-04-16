module ApplicationHelper
	
	#-------------------------------------
	#this should be refactored...
	def active!(path)
		return 'active' if current_page?(path)
	end

	def tb_active!(path)
		return 'active' if current_page?(path)
	end
	#...up to here.
	#-------------------------------------

	def current_user_is_admin
		true if current_user.admin == 't'
	end
end