class Checkininfo < ApplicationRecord
  validates_presence_of :device_id, :token, :lng, :lat, :comment, :location

  belongs_to :device
  mount_uploader :location_photo, LocationPhotoUploader
end
