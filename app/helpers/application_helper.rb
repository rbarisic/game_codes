module ApplicationHelper
	def active!(path)
		return 'pure-menu-selected' if current_page?(path)
	end

	def current_user_is_admin
		true if current_user.admin
	end
end