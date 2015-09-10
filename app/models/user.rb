class User < ActiveRecord::Base
  attr_accessor :agree
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nickname, presence: true, length: { minimum: 3, maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :community_terms, acceptance: true

  before_create :convert_avatar

  has_many :game_codes

  # Convert the uploaded file to a Base64 String. Lazy Mazy.
  def convert_avatar
    self.avatar_content_type = avatar.content_type
    self.avatar = Base64.encode64(self.avatar.read)
  end

  def admin?
  	if self.admin == 't'
  		return true
  	else
  		return false
  	end
  end

  # Process this functions when a user requests a game via the GameRequestController
  def request_a_game
    if self.requests_today >= 1
      self.requests_today -= 1
    else
      raise 'no more requests left'
    end
  end
end