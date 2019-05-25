class CreatePorts < ActiveRecord::Migration[5.2]
  def change
    create_table :ports do |t|
      t.string :name
      t.string :code
      t.string :city
      t.string :oceans_insights_code
      t.decimal :lat, precision: 20, scale: 16
      t.decimal :lng, precision: 20, scale: 16
      t.string :big_schedules
      t.string :port_type
      t.boolean :port_hub, default: false
      t.string :ocean_insights

      t.timestamps
    end

    add_index :ports, :code, unique: true
  end
end
