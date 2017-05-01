class CreateCheckininfos < ActiveRecord::Migration[5.0]
  def change
    create_table :checkininfos do |t|
      t.integer :device_id, :index => true
      t.string :token, :index => true
      t.string :lng
      t.string :lat
      t.string :comment
      t.string :location
      t.timestamps
    end
  end
end
