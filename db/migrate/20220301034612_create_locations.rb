class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.decimal :latitude
      t.decimal :longitud
      t.timestamp :sent_at

      t.timestamps
    end
  end
end
