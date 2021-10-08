class UserController < ApplicationController
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
      render json: userss
    else
      head :unauthorized
    end
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  def logout; end

  def show; end

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
