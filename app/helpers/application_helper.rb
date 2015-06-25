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

	# Verifies if the current user is actually an admin
	# Return Type: Boolean
	def current_user_is_admin
		true if current_user.admin == 't'
	end

	# Makes a string safe for use in the 'ID' attribute
	# 1st Removes artifact characters
	# 2nd Removes multiple '-' characters
	def id_safe(text)
		text.gsub(/[ .?!]/, ' ' => '-', '.' => '', '?' => '', '!' => '').gsub(/-{2,}/, '-').downcase.to_s
	end

	# An annotated tag has it's content set as it's ID
	# Whitespaces will be substituted by '-'
	def annotated_tag(tag, text, class: '')
		("<#{tag.to_s} " + "id=\"#{id_safe(text)}\" >" + text + "</#{tag.to_s}>").html_safe
		#class=\"#{class.to_s}\"
	end
end