class PortsController < ApplicationController
  def index
    outcome = IndexPortsMutation.run!(port_params)
    mutation_response(outcome, PortSerializer, :ok)
  end

  def show
    outcome = ShowPortMutation.run!(port_params)
    mutation_response(outcome, PortSerializer, :ok)
  end

  def create
    outcome = CreatePortMutation.run!(port_params)
    mutation_response(outcome, PortSerializer, :created)
  end

  def update
    outcome = UpdatePortMutation.run!(port_params)
    mutation_response(outcome, PortSerializer, :ok)
  end

  def destroy
    outcome = DeletePortMutation.run!(port_params)
    mutation_response(outcome, PortSerializer, :ok)
  end

  def create_from_csv
    outcome = CreatePortsFromCsvMutation.run!(port_params)
    mutation_response(outcome, PortSerializer, :ok)
  end

  private

  def port_params
    params.permit(
      :per, :page, :id, :name, :code, :city, :oceans_insights_code, :latitude,
      :longitude, :big_schedules, :port_type, :port_hub, :ocean_insight,
      :csv_string, :lat, :lng
    )
  end
end
