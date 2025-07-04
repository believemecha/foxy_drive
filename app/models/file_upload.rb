class FileUpload < ApplicationRecord
  belongs_to :user

  has_one_attached :file

  validates :title, presence: true
  validates :file, presence: true

  before_create :generate_short_token

  private

  # Generates a unique short token for the file upload
  def generate_short_token
    loop do
      self.short_token = SecureRandom.alphanumeric(8)
      break unless FileUpload.exists?(short_token: short_token)
    end
  end
end
