class CustomFailure < Devise::FailureApp
  def redirect_url
    authentication_failure_path
  end
end