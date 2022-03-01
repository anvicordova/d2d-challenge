class ChangeVehiclesToVehicleRegistrations < ActiveRecord::Migration[7.0]
  def change
    rename_table :vehicles, :vehicle_registrations
  end
end
