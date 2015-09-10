class Game < ActiveRecord::Base
  before_create :convert_images
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :game_codes
  validates :name, presence: true
  validates :creator, presence: true, length: { minimum: 3 }
  regex_url = /(https?|ftp):\/\/\S(.)\S(.)\S{2,5}/i
  validates :company_url, format: { with: regex_url , message: 'Please enter a real URL.' }
  validates :code_length, presence: true, numericality: { only_integer: true }

  # Convert the uploaded file to a Base64 String. Lazy Mazy.
  def convert_images
    self.cover_content_type = cover.content_type
    self.cover = Base64.encode64(self.cover.read)

    self.company_image_content_type = company_image.content_type
    self.company_image = Base64.encode64(self.company_image.read)
  end
end