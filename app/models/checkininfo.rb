class Checkininfo < ApplicationRecord
  validates_presence_of :device_id, :token, :lng, :lat, :comment, :location

  belongs_to :device
end
