class Game < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :game_codes
  validates :name, presence: true
  validates :creator, presence: true, length: { minimum: 3 }
  regex_url = /(https?|ftp):\/\/\S(.)\S(.)\S{2,5}/i
  validates :company_url, format: { with: regex_url , message: 'Please enter a real URL.' }
  validates :cover_url, format: { with: regex_url , message: 'Please enter a real URL.'  }
  validates :code_length, presence: true, numericality: { only_integer: true }
end