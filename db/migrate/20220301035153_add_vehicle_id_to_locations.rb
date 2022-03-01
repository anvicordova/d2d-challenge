class AddVehicleIdToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :vehicle_id, :integer
    add_index  :locations, :vehicle_id
  end
end
