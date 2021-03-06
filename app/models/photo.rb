class Photo < ActiveRecord::Base
  # Mounts the uploader from Carrierwave gem
  mount_uploader :filename, PhotoUploader

  belongs_to :user
  has_many :comments

  validates :filename, presence: true
  validates :caption, length: { minimum: 4 }
end
