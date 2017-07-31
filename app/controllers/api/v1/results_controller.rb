class Api::V1::ResultsController < Api::ApiController
	respond_to :json
	skip_before_action :verify_authenticity_token
	before_action :check_result, only: [:show, :destroy, :update]
  	before_action :check_user

	def create
		if params[:result][:question_id].present? && params[:result][:student_id].present?
			@result = Result.new(result_params)
		 	@result.save
		 	render json: {status: "successful",result: @result}
		else
			render json: {status: "failed", message: "Question or Student not found"}	
		end
	end

	def index

		sub = ["mathematics","chemistry","physics","biology"]
		top_math = {}
		top_bio = {}
		top_chem = {}
		top_phys = {}
		top_math_no = {}
		top_bio_no = {}
		top_chem_no = {}
		top_phys_no = {}
		sub.each do |s|
			quests = Question.where(:subject=>s).pluck(:module_test_name).uniq
			quests.each do |q|
				res = Result.where(:module_test=> "module", :module_test_name=>q,:correct=>true).count
				res_no = Result.where(:module_test=> "module", :module_test_name=>q,:correct=>false).count

				if res != 0
				if s.eql? "mathematics"
					top_math[q] = res
				end
                                if s.eql? "chemistry"
                                        top_chem[q] = res
                                end
                                if s.eql? "physics"
                                        top_phys[q] = res
                                end
                                if s.eql? "biology"
                                        top_bio[q] = res
                                end
				end

                                if res_no != 0
                                if s.eql? "mathematics"
                                        top_math_no[q] = res
                                end
                                if s.eql? "chemistry"
                                        top_chem_no[q] = res
                                end
                                if s.eql? "physics"
                                        top_phys_no[q] = res
                                end
                                if s.eql? "biology"
                                        top_bio_no[q] = res
                                end
                                end
			end
		end

		
		top_math = top_math.sort_by {|_key, value| value}
		top_chem = top_chem.sort_by {|_key, value| value}
		top_phys = top_phys.sort_by {|_key, value| value}
		top_bio = top_bio.sort_by {|_key, value| value}

                top_math_no = top_math_no.sort_by {|_key, value| value}
                top_chem_no = top_chem_no.sort_by {|_key, value| value}
                top_phys_no = top_phys_no.sort_by {|_key, value| value}
                top_bio_no = top_bio_no.sort_by {|_key, value| value}		

		if top_math.length == 1
			@top_math = top_math.sort_by {|_key, value| value}.to_a
		end

                if top_math.length == 2
                        @top_math = top_math.sort_by {|_key, value| value}.to_a[-2..-1]
                end

                if top_math.length > 2
                        @top_math = top_math.sort_by {|_key, value| value}.to_a[-3..-1]
                end
		
                if top_math_no.length == 1
                        @top_math_no = top_math_no.sort_by {|_key, value| value}.to_a
                end

                if top_math_no.length == 2
                        @top_math_no = top_math_no.sort_by {|_key, value| value}.to_a[-2..-1]
                end

                if top_math_no.length > 2
                        @top_math_no = top_math_no.sort_by {|_key, value| value}.to_a[-3..-1]
                end


                if top_bio.length == 1
                        @top_bio = top_bio.sort_by {|_key, value| value}.to_a
                end

                if top_bio.length == 2
                        @top_bio = top_bio.sort_by {|_key, value| value}.to_a[-2..-1]
                end

                if top_bio.length > 2
                        @top_bio = top_bio.sort_by {|_key, value| value}.to_a[-3..-1]
                end

                if top_bio_no.length == 1
                        @top_bio_no = top_bio_no.sort_by {|_key, value| value}.to_a
                end

                if top_bio_no.length == 2
                        @top_bio_no = top_bio_no.sort_by {|_key, value| value}.to_a[-2..-1]
                end

                if top_bio_no.length > 2
                        @top_bio_no = top_bio_no.sort_by {|_key, value| value}.to_a[-3..-1]
                end

                if top_chem.length == 1
                        @top_chem = top_chem.sort_by {|_key, value| value}.to_a[-1]
                end

                if top_chem.length == 2
                        @top_chem = top_chem.sort_by {|_key, value| value}.to_a[-2..-1]
                end

                if top_chem.length > 2
                        @top_chem = top_chem.sort_by {|_key, value| value}.to_a[-3..-1]
                end

                if top_chem_no.length == 1
                        @top_chem_no = top_chem_no.sort_by {|_key, value| value}.to_a[-1]
                end

                if top_chem_no.length == 2
                        @top_chem_no = top_chem_no.sort_by {|_key, value| value}.to_a[-2..-1]
                end

                if top_chem_no.length > 2
                        @top_chem_no = top_chem_no.sort_by {|_key, value| value}.to_a[-3..-1]
                end

                if top_phys.length == 1
                        @top_phys = top_phys.sort_by {|_key, value| value}.to_a[-1]
                end

                if top_phys.length == 2
                        @top_phys = top_phys.sort_by {|_key, value| value}.to_a[-2..-1]
                end

                if top_phys.length > 2
                        @top_phys = top_phys.sort_by {|_key, value| value}.to_a[-3..-1]
                end

                if top_phys_no.length == 1
                        @top_phys_no = top_phys_no.sort_by {|_key, value| value}.to_a[-1]
                end

                if top_phys_no.length == 2
                        @top_phys_no = top_phys_no.sort_by {|_key, value| value}.to_a[-2..-1]
                end

                if top_phys_no.length > 2
                        @top_phys_no = top_phys_no.sort_by {|_key, value| value}.to_a[-3..-1]
                end


		if top_math.empty?
			@top_math = []
		end
		if top_bio.empty?
			@top_bio = []
		end
                if top_chem.empty?
                        @top_chem = []
                end
                if top_phys.empty?
                        @top_phys = []
                end

                if top_math_no.empty?
                        @top_math_no = []
                end
                if top_bio_no.empty?
                        @top_bio_no = []
                end
                if top_chem_no.empty?
                        @top_chem_no = []
                end
                if top_phys_no.empty?
                        @top_phys_no = []
                end

		@math_total_module = Question.where(:subject=>"mathematics",:module_test => "module").count
		@math_correct_module = Result.where(:subject=>"mathematics",:student_id=>current_user.id, :module_test=>"module", :correct=>true).count
		@math_total_exam = Question.where(:subject=>"mathematics",:module_test => "test").count
		@math_correct_exam = Result.where(:subject=>"mathematics",:student_id=>current_user.id, :module_test=>"test",:correct=>true).count
	
                @phys_total_module = Question.where(:subject=>"physics",:module_test => "module").count
                @phys_correct_module = Result.where(:subject=>"physics",:student_id=>current_user.id, :module_test=>"module", :correct=>true).count
                @phys_total_exam = Question.where(:subject=>"physics",:module_test => "test").count
                @phys_correct_exam = Result.where(:subject=>"physics",:student_id=>current_user.id, :module_test=>"test",:correct=>true).count

                @bio_total_module = Question.where(:subject=>"biology",:module_test => "module").count
                @bio_correct_module = Result.where(:subject=>"biology",:student_id=>current_user.id, :module_test=>"module", :correct=>true).count
                @bio_total_exam = Question.where(:subject=>"biology",:module_test => "test").count
                @bio_correct_exam = Result.where(:subject=>"biology",:student_id=>current_user.id, :module_test=>"test",:correct=>true).count

                @chem_total_module = Question.where(:subject=>"chemistry",:module_test => "module").count
                @chem_correct_module = Result.where(:subject=>"chemistry",:student_id=>current_user.id, :module_test=>"module", :correct=>true).count
                @chem_total_exam = Question.where(:subject=>"chemistry",:module_test => "test").count
                @chem_correct_exam = Result.where(:subject=>"chemistry",:student_id=>current_user.id, :module_test=>"test",:correct=>true).count
	
	
		render json: {status: "successful", math_total_module: @math_total_module, math_correct_module: @math_correct_module, math_total_exam: @math_total_exam, math_correct_exam: @math_correct_exam, phys_total_module: @phys_total_module, phys_correct_module: @phys_correct_module, phys_total_exam: @phys_total_exam, phys_correct_exam: @phys_correct_exam, bio_total_module: @bio_total_module, bio_correct_module: @bio_correct_module, bio_total_exam: @bio_total_exam, bio_correct_exam: @bio_correct_exam, chem_total_module: @chem_total_module, chem_correct_module: @chem_correct_module, chem_total_exam: @chem_total_exam, chem_correct_exam: @chem_correct_exam, top_math: @top_math, top_math_no: @top_math_no, top_bio: @top_bio, top_bio_no: @top_bio_no, top_chem: @top_chem, top_chem_no: @top_chem_no, top_phys: @top_phys, top_phys_no: @top_phys_no}


	end

	def show
		if @result.present?
			render json: {status: "successful",result: @result}
		else
			render json: {status: "failed", message: "Result not found"}	
		end
	end


	def destroy			
		if @result.present?
			@result.destroy
			render json: {status: "successful", message: "Result informations successfully deleted"}
		else
			render json: {status: "failed", message: "Result not found"}	
		end
	end

	def update
		if @result.present?
			@result.update(result_params)
			render json: {status: "successful", result: @result}
	 	else
	 		render json: { status: "failed", message: "Result not found"}
	 	end
	end

	def student_guess
		ques = Question.where(:id=>params[:question_id])[0]
		mod_test_name = ques.module_test_name
		mod_test = ques.module_test
		ans = ques.answer
		sub = ques.subject
		num = ques.number
		if ans.eql? params[:question_answer]
			cr = true
		else
			cr = false
		end
		res = Result.where(:student_id=>current_user.id,:question_id=>params[:question_id])
		if res.count > 0
			res[0].correct = cr
			res[0].student_answer = params[:question_answer]
			res[0].save
		else
			res_save = Result.create(:student_id=>current_user.id,:question_id=>params[:question_id],:correct=>cr,:student_answer=>params[:question_answer], :module_test=>mod_test,:subject=>sub,:number=>num, :module_test_name=>mod_test_name)
			res_save.save
		end
		render json: {status: "successful"}
	end

	private 

  def result_params
    params.require(:result).permit(:question_id, :student_id, :correct,:student_answer, :module_test,:subject, :number, :module_test_name )
  end

  def check_result
		if params[:id].present?
			@result = Result.where(id: params[:id])[0]
		else
			render json: {status: "failed", message: "Result id not present"}
		end
  end

  def check_user
  	unless current_user.present?
	 		render json: {status: "failed", message: "Your authentication token not valid"}
		else
		end
  end
end
