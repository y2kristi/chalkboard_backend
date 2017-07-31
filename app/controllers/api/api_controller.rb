class Api::ApiController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

	#--Overwrite devise method
	def current_user
    token = request.headers['Authorization'].presence
    if token
		  @current_user ||= Student.find_by_activation_token(token)
    end
	end

	def authenticate_with_token!
		render json: { errors: "Not authenticated"}, status: :unauthorized unless current_user.present?
	end

  def not_found
    render json: {errors: 'Not found' }, status: 404
  end
end