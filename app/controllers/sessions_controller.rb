class SessionsController < ActionController::API
  def login
    @user = User.find_by_email(login_params[:email])
    if @user&.authenticate(login_params[:password])
      render json: generate_token(@user), status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def signup
    @user = User.find_by_email(params[:email])
    if @user.present?
      render json: { error: 'email already registered' }, status: :unauthorized
    else
      @user = User.create!(signup_params)
      render json: generate_token(@user), status: :ok
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def signup_params
    params.permit(:email, :password, :password_confirmation)
  end

  def generate_token(user)
    token = JsonWebToken.encode(user_id: user.id)
    time = Time.now + 24.hours.to_i

    user.update_attributes!(
      token: token,
      token_created_at: Time.now,
      token_expires_at: time
    )
    { token: user.token, exp: time.strftime("%m-%d-%Y %H:%M") }
  end
end
