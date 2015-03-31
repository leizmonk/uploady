class Photo < ActiveRecord::Base
  # Mounts the uploader from Carrierwave gem
  mount_uploader :filename, PhotoUploader

  belongs_to :user
end
