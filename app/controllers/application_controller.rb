class ApplicationController < ActionController::API
  include ResponseConcern

  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      user = User.find_by_token(header)
      if user.present? && verify_user(user, header)
        @current_user = user
      else
        msg = 'You are not authorized to perform this action!'
        raise StandardError, msg
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    rescue StandardError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def verify_user(user, header)
    if user.token.present? && Time.now >= user.token_expires_at
      user.update_attributes!(
        token: nil,
        token_created_at: nil,
        token_expires_at: nil
      )
      msg = 'Session Expired!, Please re-login to continue.'
      raise StandardError, msg
    end

    decoded = JsonWebToken.decode(header)
    return user if decoded[:user_id] == user.id

    false
  end
end
