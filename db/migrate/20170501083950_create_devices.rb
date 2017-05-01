class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.integer :user_id, :index => true
      t.string :token, :index => true
      t.string :operating_system
      t.string :version
      t.string :name
      t.timestamps
    end
  end
end
