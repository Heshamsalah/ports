class CreatePortMutation < Mutations::Command
  required do
    string :name
    string :code
    string :lat
    string :lng
    string :port_type
    boolean :port_hub
  end

  optional do
    string :city
    string :oceans_insights_code
    string :ocean_insights
    string :big_schedules
  end

  def execute
    Port.create!(inputs)
  end
end
