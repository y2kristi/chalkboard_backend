class Api::V1::QuestionsController < Api::ApiController
  respond_to :json
  skip_before_action :verify_authenticity_token
  before_action :check_question, only: [:show, :destroy, :update]
  before_action :check_user
	def create
	 	@question = current_user.questions.new(question_params)
	 	@question.save
	 	render json: {status: "successful",question: @question}
	end

	def index
		render json: {status: "successful", question: Question.all}
	end

	def show
		if @question.present?
			render json: {status: "successful",question: @question}
		else
			render json: {status: "failed", message: "Question not found"}	
		end
	end

	def destroy	
		if @question.present?
			@question.destroy_all
			render json: {status: "successful", message: "Question informations successfully deleted"}
		else
			render json: {status: "failed", message: "Question not found"}	
		end
	end

	def update
		if @question.present?
			@question.update(question_params)
			render json: {status: "successful",question: @question}
	 	else
	 		render json: { status: "failed", message: "Question not found"}
	 	end
	end

	def subject
		@list_modules_test = Question.where(:subject=>params[:subject_id],:module_test=>params[:module_test]).pluck(:module_test_name).uniq
		@results = {}
		@list_modules_test.each { |x| 
			tot = Question.where(:subject=>params[:subject_id],:module_test=>params[:module_test], :module_test_name=>x).count
			res = Result.where(:student_id=>current_user.id, :subject=>params[:subject_id],:module_test=>params[:module_test],:module_test_name=>x,:correct=>true).count
			val = [tot,res]
			@results[x] = val
		}
		@paid = Pin.where(:student_id=>current_user.id,:subject=>params[:subject_id]).length
		puts params[:subject_id]
		render json: {status: "successful", list: @list_modules_test, score: @results, paid: @paid}
	end

	def question_module
		@total = Question.where(:subject=>params[:subject_id],:module_test=>params[:module_test],:module_test_name=>params[:module_test_name]).count
		@question = Question.where(:subject=>params[:subject_id],:module_test=>params[:module_test],:module_test_name=>params[:module_test_name], :number=>params[:number])
		@image_url = @question[0].image.url
		@image_solution = @question[0].image_solution.url
		@choice_a_image = @question[0].choice_a_image.url(:medium)
		@choice_b_image = @question[0].choice_b_image.url(:medium)
		@choice_c_image = @question[0].choice_c_image.url(:medium)
		@choice_d_image = @question[0].choice_d_image.url(:medium)
		@result = Result.where(:question_id=>@question[0].id)

		@yes = Result.where(:correct=>true, :subject=>params[:subject_id],:module_test_name=>params[:module_test_name],:student_id=>current_user.id).count
		@no = Result.where(:correct=>false, :subject=>params[:subject_id],:module_test_name=>params[:module_test_name],:student_id=>current_user.id).count

	
		render json: {status: "successful", total: @total, question: @question, result: @result, image_url: @image_url,image_solution: @image_solution, choice_a_image: @choice_a_image, choice_b_image: @choice_b_image, choice_c_image: @choice_c_image, choice_d_image: @choice_d_image, correct_yes: @yes, correct_no: @no}
	end
	
	private 

  def question_params
    params.require(:question).permit(:question, :choice_a , :choice_b ,:choice_c,:choice_d, :answer, :module_test , :subject , :number, :module_test_name, :timer, :solution, :image_file_name, :image_content_type, :image_file_size ,:image_updated_at, :image_solution_file_name, :image_solution_content_type, :image_solution_file_size, :image_solution_updated_at,:choice_a_image_file_name, :choice_a_image_content_type, :choice_a_image_file_size, :choice_a_image_updated_at,:choice_b_image_file_name, :choice_b_image_content_type,:choice_b_image_file_size, :choice_b_image_updated_at,:choice_c_image_file_name, :choice_c_image_content_type,:choice_c_image_file_size, :choice_c_image_updated_at, :choice_d_image_file_name, :choice_d_image_content_type,:choice_d_image_file_size,:choice_d_image_updated_at)
  end

  def check_question
		if params[:id].present?
			@question = Question.where(id: params[:id])
		else
			render json: {status: "failed", message: "Question id not present"}
		end
  end

  def check_user
  	unless current_user.present?
	 		render json: {status: "failed", message: "Your authentication token not valid"}
		else
		end
  end
end
