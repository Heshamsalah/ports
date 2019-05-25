class IndexPortsMutation < Mutations::Command
  optional do
    integer :page, default: 1
    integer :per, default: 10
    string :id
    string :code
    string :name
    string :city
    string :big_schedules
    string :port_type
    string :lat
    string :lng
    string :oceans_insights_code
    string :ocean_insights
    string :from_date
    string :to_date
  end

  def execute
    Port.ransack(ransack_query).result.page(inputs[:page]).per(inputs[:per])
  end

  private

  def ransack_query
    {
      id_eq: inputs[:id],
      code_eq: inputs[:code],
      name_eq: inputs[:name],
      city_eq: inputs[:city],
      port_type_eq: inputs[:port_type],
      lat_eq: inputs[:lat],
      lng_eq: inputs[:lng],
      oceans_insights_code_eq: inputs[:oceans_insights_code],
      ocean_insights_eq: inputs[:ocean_insights],
      big_schedules_eq: inputs[:big_schedules],
      created_at_gteq: inputs[:from_date],
      created_at_lteq: inputs[:to_date].try(:to_date).try(:end_of_day)
                                       .try(:to_s)
    }.delete_if { |_k, v| v.blank? }
  end
end
