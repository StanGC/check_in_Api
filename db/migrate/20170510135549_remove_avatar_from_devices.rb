class RemoveAvatarFromDevices < ActiveRecord::Migration[5.0]
  def change
    remove_column :devices, :avatar, :string
  end
end
