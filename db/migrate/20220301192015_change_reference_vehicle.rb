class ChangeReferenceVehicle < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :vehicle_id, :vehicle_registration_id
  end
end
