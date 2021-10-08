class ApplicationController < ActionController::API
  def authentication_failure
    render json: { message: 'Você não está logado!' }, status: :unauthorized
  end
end
