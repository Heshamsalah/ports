class CreatePortsFromCsvMutation < Mutations::Command
  required do
    string :csv_string
  end

  def execute
    csv = CsvHandler.new(csv_string)
    ports = []
    faild = []

    csv.rows.each do |row|
      ports << CreatePortMutation.run!(create_port_params(row))
    rescue StandardError => e
      faild << { resource: row, error: e.message }
    end

    ports
  end

  private

  def create_port_params(data_row)
    {
      name: data_row[:name],
      code: data_row[:code],
      city: data_row[:city],
      lat: data_row[:latitude],
      lng: data_row[:longitude],
      port_type: data_row[:port_type],
      port_hub: data_row[:port_hub],
      oceans_insights_code: data_row[:oceans_insights_code],
      ocean_insights: data_row[:ocean_insights],
      big_schedules: data_row[:big_schedules]
    }.delete_if { |_, v| v.blank? && v != false }
  end
end
