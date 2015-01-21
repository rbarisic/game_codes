class Game < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :game_codes
  validates :name, presence: true
  validates :creator, presence: true, length: { minimum: 3 }
  validates :company_url, format: { with: /(https?|ftp):\/\/\S(.)\S(.)\S{2,5}/i, message: 'Please enter a real URL.' }
end