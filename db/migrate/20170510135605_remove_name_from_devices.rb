class RemoveNameFromDevices < ActiveRecord::Migration[5.0]
  def change
    remove_column :devices, :name, :string
  end
end
