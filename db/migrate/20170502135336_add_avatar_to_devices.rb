class AddAvatarToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :avatar, :string
  end
end
