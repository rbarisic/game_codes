class GameCode < ActiveRecord::Base
	attr_accessor :code_length
  belongs_to :user
  belongs_to :game
  validates :user_id, presence: true
  validates :game_id, presence: true
  validate :game_code_length

  private
	  def game_code_length
	  	errors.add(:code, "length should be #{code_length}") if code_length != code.length
		#if self.game.code_length
		#	errors.add(:code, "Your Code can only contain #{self.game.code_length} characters.") if self.code.count != self.game.code_length
		#else
		#	errors.add(:game, "Your Game doesn't exist.")
		#end
	  end
end