class AddUniqueToVehicleUuid < ActiveRecord::Migration[7.0]
  def change
    add_index :vehicle_registrations, :uuid, unique: true
  end
end
