module ResponseConcern
  extend ActiveSupport::Concern

  private

  def mutation_response(outcome, serializer, status, options = {})
    render json: serialize(outcome, serializer, options), status: status
  end

  def serialize(resource, serializer, options)
    serializer.new(resource, options).serialized_json
  end
end
