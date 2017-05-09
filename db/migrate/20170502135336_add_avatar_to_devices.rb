class AddAvatarToDevices < ActiveRecord::Migration[5.0]
  def change
    remove_column :devices, :avatar, :string
    remove_column :devices, :name, :string
  end
end
