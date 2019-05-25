class PortSerializer
  include FastJsonapi::ObjectSerializer
  set_type :port
  attributes :name, :code, :lng, :lat, :port_type, :big_schedules,
             :port_hub, :city, :oceans_insights_code, :ocean_insights
end
