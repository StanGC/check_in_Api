require 'rails_helper'

RSpec.describe Device, type: :model do
  describe "device model" do

    it "is create" do
      device = Device.new( :user_id => "2",
                           :token => "zd8VVYVQpfzpLuini6Di",
                           :operating_system => "ios",
                           :version => "10.3",
                           :name => "guest",
                           :created_at => Time.now,
                           :updated_at => Time.now,
                           :avatar => "/uploads/user/avatar/2/image.png")
      expect( device ).to_not be_valid
    end
  end
end
