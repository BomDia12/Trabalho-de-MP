class UserController < ApplicationController
  acts_as_token_authentication_handler_for User,
                                           only: %i[show logout edit]

  # H1
  def register
    user = User.new(user_params)
    user.save!
    render json: user
  rescue StandardError => e
    render json: { message: e.message }, status: :bad_request
  end

  # H2
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

  # H1 & H2
  def show
    render json: current_user
  end

  # H3
  def edit
    current_user.update!(user_params)
    render json: current_user
  rescue StandardError => e
    render json: { message: e.message }, status: :bad_request
  end

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
