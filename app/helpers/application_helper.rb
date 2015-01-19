module ApplicationHelper
	def active!(path)
		return 'pure-menu-selected' if current_page?(path)
	end
end