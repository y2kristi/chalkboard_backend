class Api::V1::ResetPasswordsController < Api::ApiController
  respond_to :json
#  skip_before_action :verify_authenticity_token


	def create
		puts params[:id]
		email = params[:id]
		@student = Student.where(:email => email)

		random_password = Array.new(10).map { (65 + rand(58)).chr }.join

		@student[0].password = random_password

  		if @student[0].save

		# First, instantiate the Mailgun Client with your API key
		mg_client = Mailgun::Client.new 'key-26b3924502603002f75c25ebde19be8e'

		# Define your message parameters
		message_params =  { from: '242Chalkboard postmaster@mg.coral.media',
                    to:   email,
                    subject: '242Chalkboard: Reset Password',
                    text:    "Temporary Password: #{random_password}"
               	}

		# Send your message through the client
		mg_client.send_message 'mg.coral.media', message_params
		
		render json: {status: "successful"}
		else
		render json: {status: "failed"}

		end
	end
end
