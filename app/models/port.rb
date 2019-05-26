class Port < ApplicationRecord
  validates_presence_of :code, :name, :lng, :lat, :port_type
  validates_inclusion_of :port_hub, in: [true, false]
  validates :lat, :lng, numericality: true
end
