class Port < ApplicationRecord
  validates_presence_of :code, :name, :lng, :lat, :port_type, :port_hub
  validates :lat, :lng, numericality: true
end
