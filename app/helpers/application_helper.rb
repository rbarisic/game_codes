module ApplicationHelper
	def active!(path)
		return 'pure-menu-selected' if current_page?(path)
	end

	def current_user_is_admin
		return true if current_user.admin == true
	end
end