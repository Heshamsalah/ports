class UpdatePortMutation < Mutations::Command
  required do
    string :id
  end

  optional do
    string :code
    string :name
    string :city
    string :big_schedules
    boolean :port_hub
    string :port_type
    string :lat
    string :lng
    string :oceans_insights_code
    string :ocean_insights
  end

  def execute
    port = Port.find(inputs[:id])
    port.update_attributes(inputs.except(:id))
    port.reload
  end
end
