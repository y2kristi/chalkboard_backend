class Api::V1::SessionsController < Api::ApiController
  respond_to :json
  skip_before_action :verify_authenticity_token
  before_filter :ensure_params_exist, only: [:create]

  def create 
    resource = Student.find_for_database_authentication(email: params[:student][:email])
      return invalid_login_attempt unless resource
      if resource.valid_password?(params[:student][:password])
        sign_in("student", resource)
        render json: {status: "successful", student: resource}
          return
       end
      invalid_login_attempt
  end

  def destroy 
    if current_user.present?
      session[:user_id] = nil
      current_user = nil
      render json: {status: "successful", message: "Your Account Logged Out Successfully" }
    else
      render json: {status: "failed", message: "Authentication token is not valid" }
    end
  end

  protected

  def ensure_params_exist
    return unless params[:student].blank?
      render json: {status: "failed", message: "Missing student Parameter"}
  end

  def invalid_login_attempt
    warden.custom_failure!
      render json: {status: "failed", message: "Error with your Email or password"}
  end

end