class Game < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :codes
  validates :name, presence: true
  validates :creator, presence: true, length: { minimum: 3 }
end