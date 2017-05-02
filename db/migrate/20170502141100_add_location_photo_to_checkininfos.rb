class AddLocationPhotoToCheckininfos < ActiveRecord::Migration[5.0]
  def change
    add_column :checkininfos, :location_photo, :string
  end
end
