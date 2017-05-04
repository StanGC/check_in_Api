class Device < ApplicationRecord
  validates_presence_of :user_id, :token, :operating_system, :version, :avatar, :name

  belongs_to :user
  has_many :reservations

  before_create :generate_token

  def generate_token
    self.token = Devise.friendly_token
  end
end
