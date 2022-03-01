class RemoveUniqueIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :completions, name: "index_vehicle_registrations_on_uuid"
  end
end
