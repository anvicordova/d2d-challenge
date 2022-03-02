class AddBearingAngleField < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :bearing_angle , :decimal
  end
end
