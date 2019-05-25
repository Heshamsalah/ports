class PortsController < ApplicationController
  def index
    outcome = IndexPortsMutation.run!(port_params)
    mutation_response(outcome[:result], PortSerializer, :ok)
  end

  def show
    outcome = ShowPortMutation.run!(port_params)
    mutation_response(outcome[:result], PortSerializer, :ok)
  end

  def create
    outcome = CreatePortMutation.run!(port_params)
    mutation_response(outcome[:result], PortSerializer, :created)
  end

  def update
    outcome = UpdatePortMutation.run!(port_params)
    mutation_response(outcome[:result], PortSerializer, :ok)
  end

  def delete
    outcome = DeletePortMutation.run!(port_params)
    mutation_response(outcome[:result], PortSerializer, :ok)
  end

  private

  def port_params
    params.permit(
      :per, :page, :id, :name, :code, :city, :oceans_insight_code, :latitude,
      :longitude, :big_schedules, :port_type, :port_hub, :oceans_insight,
      :ports_csv_file
    )
  end
end
