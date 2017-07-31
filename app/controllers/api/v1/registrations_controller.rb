class Api::V1::RegistrationsController < Api::ApiController
  respond_to :json
  skip_before_action :verify_authenticity_token
  before_action :check_student, only: [:create]

  def create
    if params[:student][:email].blank? || params[:student][:password].blank? || params[:student][:password_confirmation].blank?
      render json: {status: "failed", message: "Missing parameters"}
    else
      @student = Student.new(student_params)
      @student.generate_auth_token!
      if @student.save
        render json: {status: "successful", student: @student}
      else 
        render json: {status: "failed", student: @student.errors}
      end
    end
  end
  
  private 

  def student_params
    params.require(:student).permit(:email,:password,:password_confirmation,:nickname , :first, :last, :age, :school, :grade,:island, :remember_token, :gender, :active )
  end

  def check_student
    if Student.exists?(email: params[:student][:email])
      render  json: {status: "failed", message: "student already exists"}
    end
  end
end


