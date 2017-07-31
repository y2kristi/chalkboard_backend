class Api::V1::ProfilesController < Api::ApiController
  respond_to :json
  skip_before_action :verify_authenticity_token
  before_action :check_user
	

  def show
    render json: {status: "successful", student: @asked_user }
  end

  def update 
    if @asked_user.present?
      @asked_user.update(profiles_params)
      render json: {status: "successful",student: @student}
    else
      render json: { status: "failed", message: "Student not found"}
    end

  end



	private 

  def profiles_params
    params.require(:student).permit(:email, :nickname, :first, :last, :age, :school, :grade, :island, :gender)
  end


  def check_user
    @asked_user = Student.find_by_activation_token(params[:student][:activation_token])
    unless @asked_user.present?
      render json: {status: "failed", message: "Your authentication token not valid"}
    else
      #
      @asked_user
    end
  end
end