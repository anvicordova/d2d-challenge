class FixLocationColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :longitud, :longitude
  end
end
