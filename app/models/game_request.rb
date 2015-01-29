class GameRequest < ActiveRecord::Base
	attr_accessor :completed
	validates :name, presence: true, length: { minimum: 2, maximum: 255 }
	validates :requests, numericality: { only_integer: true }
	validates :creator, length: { minimum: 3 }
	regex_url = /(https?|ftp):\/\/\S(.)\S(.)\S{2,5}/i
	validates :company_url, format: { with: regex_url , message: 'Please enter a real URL.' }
	validates :cover_url, format: { with: regex_url , message: 'Please enter a real URL.'  }
	validates :code_length, numericality: { only_integer: true }
	
	def completed?
		if ( self.name && self.creator && self.code_length && self.description && self.company_url && self.cover_url )
			self.completed = true 
		else
			self.completed = false
		end
	end
end