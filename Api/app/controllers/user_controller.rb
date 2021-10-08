class UserController < ApplicationController
  acts_as_token_authentication_handler_for User, only: %i[show logout]

  def register
    user = User.new(user_params)
    user.save!
    render json: user
  rescue StandardError => e
    render json: { message: e.message }, status: :bad_request
  end

  def login
    user = User.find_by(email: params[:email])
    if user.valid_password? params[:password]
      render json: user
    else
      head :unauthorized
    end
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  def logout
    current_user.update(authentication_token: nil)
    head :ok
  end

  def show
    render json: current_user
  end

  def edit; end

  private

  def user_params
    params.permit(
      :email,
      :name,
      :password,
      :password_confirmation
    )
  end
end
