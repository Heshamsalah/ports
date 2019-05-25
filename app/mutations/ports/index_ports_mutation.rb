class IndexPortsMutation < Mutations::Command
  optional do
    string :id
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
    integer :page, default: 1
    integer :per, default: 10
  end

  def execute
    Port.page(inputs[:page]).per(inputs[:per])
  end
end
