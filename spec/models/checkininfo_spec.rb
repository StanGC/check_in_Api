require 'rails_helper'

RSpec.describe Checkininfo, type: :model do
  describe "checkininfo model" do

    it "is create" do
      checkininfo = Checkininfo.new( :device_id => "1",
                                     :token => "Ho3wup9dVKGMDfuAaTq2",
                                     :lng => "123",
                                     :lat => "321",
                                     :comment => "comment",
                                     :location => "taipei",
                                     :location_photo => "image.png",
                                     :created_at => Time.now,
                                     :updated_at => Time.now)
      expect( checkininfo ).to_not be_valid
    end
  end
end
