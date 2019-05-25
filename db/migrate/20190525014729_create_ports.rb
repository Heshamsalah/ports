class CreatePorts < ActiveRecord::Migration[5.2]
  def change
    create_table :ports do |t|
      t.string :name
      t.string :code
      t.string :city
      t.string :oceans_insight_code
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :big_schedules
      t.string :port_type
      t.boolean :port_hub, default: false
      t.string :oceans_insights

      t.timestamps
    end

    add_index :ports, :code, unique: true
  end
end
