class Api::V1::DashboardController < Api::ApiController
	respond_to :json
	skip_before_action :verify_authenticity_token
	before_action :check_result, only: [:show, :destroy, :update]
  	before_action :check_user

	def index
		@today = Result.where(:student_id=>current_user.id).where("updated_at >= ? AND updated_at <= ?",Date.today.to_time.beginning_of_day,Date.today.to_time.end_of_day).count

		@subs = Result.where(:student_id=>current_user.id).pluck(:subject).uniq.count
		@mods = Result.where(:student_id=>current_user.id, :module_test=>"module").pluck(:module_test_name).uniq.count
		@tests = Result.where(:student_id=>current_user.id, :module_test=>"test").pluck(:module_test_name).uniq.count
		@member = Student.where(:id=>current_user.id).pluck(:created_at)[0].strftime("%m-%d-%Y")	

		@one_past = Result.where(:student_id=>current_user.id).where("updated_at >= ? AND updated_at <= ?",(Date.today-1.days).to_time.beginning_of_day,(Date.today-1.days).to_time.end_of_day).count
		@two_past = Result.where(:student_id=>current_user.id).where("updated_at >= ? AND updated_at <= ?",(Date.today-2.days).to_time.beginning_of_day,(Date.today-2.days).to_time.end_of_day).count
		@three_past = Result.where(:student_id=>current_user.id).where("updated_at >= ? AND updated_at <= ?",(Date.today-3.days).to_time.beginning_of_day,(Date.today-3.days).to_time.end_of_day).count
		@four_past = Result.where(:student_id=>current_user.id).where("updated_at >= ? AND updated_at <= ?",(Date.today-4.days).to_time.beginning_of_day,(Date.today-4.days).to_time.end_of_day).count
		@five_past = Result.where(:student_id=>current_user.id).where("updated_at >= ? AND updated_at <= ?",(Date.today-5.days).to_time.beginning_of_day,(Date.today-5.days).to_time.end_of_day).count
		@six_past = Result.where(:student_id=>current_user.id).where("updated_at >= ? AND updated_at <= ?",(Date.today-6.days).to_time.beginning_of_day,(Date.today-6.days).to_time.end_of_day).count
		@seven_past = Result.where(:student_id=>current_user.id).where("updated_at >= ? AND updated_at <= ?",(Date.today-7.days).to_time.beginning_of_day,(Date.today-7.days).to_time.end_of_day).count
		render json: {status: "successful", today: @today, one_past: @one_past, two_past: @two_past, three_past: @three_past, four_past: @four_past, five_past: @five_past, six_past: @six_past, seven_past: @seven_past, date_one: Date.today-1.days, date_two: Date.today-2.days, date_three: Date.today-3.days, date_four: Date.today-4.days, date_five: Date.today-5.days, date_six: Date.today-6.days, date_seven: Date.today-7.days, subjects: @subs, modules: @mods, tests: @tests, member: @member}
	end

	private 


  def check_user
  	unless current_user.present?
	 		render json: {status: "failed", message: "Your authentication token not valid"}
		else
		end
  end
end
