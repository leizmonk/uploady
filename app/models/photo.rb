class Photo < ActiveRecord::Base
  # Mounts the uploader from Carrierwave gem
  mount_uploader :filename, PhotoUploader
end
