class FileUpload < ApplicationRecord
  belongs_to :user

  has_one_attached :file

  validates :title, presence: true
  validates :file, presence: true

  before_create :generate_short_token

  private

  def generate_short_token
    self.short_token = SecureRandom.alphanumeric(8)
  end
end
