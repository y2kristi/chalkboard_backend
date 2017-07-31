class Api::V1::PinsController < Api::ApiController
	respond_to :json
	skip_before_action :verify_authenticity_token
	before_action :check_result, only: [:show, :destroy, :update]
  	before_action :check_user

	def index
		@pin = Pin.where(:student_id=>current_user.id)
		render json: {status: "success", pin: @pin}

	end

	def create
		pin = params[:pin]
		sub = params[:subject]
		there = Pin.where(:pin=>pin)
		if there.length > 0
			use = there[0].usage
			if use.eql? false
				there[0].usage = true
				there[0].subject = sub
				there[0].student_id = current_user.id
				there[0].expiration = 365.days.from_now
				there[0].save				
				render json: {status: "success"}
			else
				render json: {status: "fail"}
			end
		else
			render json: {status: "fail"}
		end
	end


	def update
		render json: {status: "success"}
	end

	private 


  def check_user
  	unless current_user.present?
	 		render json: {status: "failed", message: "Your authentication token not valid"}
		else
		end
  end
end
