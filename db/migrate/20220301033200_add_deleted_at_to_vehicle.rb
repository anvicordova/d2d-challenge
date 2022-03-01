# frozen_string_literal: true

class AddDeletedAtToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :deleted_at, :datetime
    add_index :vehicles, :deleted_at
  end
end
