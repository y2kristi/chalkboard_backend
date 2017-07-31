class Api::V1::ResetsController < Api::ApiController
  respond_to :json
#  skip_before_action :verify_authenticity_token


	def create
		email = params[:id]
		tmp = params[:tmp]
		pwd = params[:pwd]
		@student = Student.where(:email=>'live@coral.media')
		if @student.length > 0
			if @student[0].valid_password?(tmp)
			@student[0].password = pwd
			@student[0].save
			render json: {status: "successful"}
			else
			render json: {status: "failed"}
			end
		else
		render json: {status: "failed"}
		end
	end
end
