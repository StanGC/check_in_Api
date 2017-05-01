class Device < ApplicationRecord
  validates_presence_of :user_id, :token, :operating_system, :version, :avatar, :name

  belongs_to :user
  has_many :reservations
end
