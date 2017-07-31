namespace :import_data do
  desc "TODO"
  task :import_questions => :environment do
  	puts "...delete the old questions..."
  	Question.all.delete_all
  	puts "...start import the questions..."
  	# server
  	CSV.foreach("/root/chalkboard/config/questions.csv") do |row|
    # local
    # CSV.foreach("/home/yuvasoft/Projects/questions.csv") do |row|
			Question.create(:question   => row[1],:choice_a   => row[2],:choice_b   => row[3],:choice_c   => row[4],:choice_d   => row[5],:answer   => row[6],:created_at     => row[7],:updated_at      => row[8],:module_test   => row[9],:subject   => row[10],:number   => row[11],:module_test_name   => row[12],:timer   => row[13],:image_file_name   => row[14],:image_content_type   => row[15],:image_file_size   => row[16],:image_updated_at   => row[17],:solution       => row[18],:image_solution_file_name   => row[19],:image_solution_content_type   => row[20],:image_solution_file_size   => row[21],:image_solution_updated_at   => row[22],:choice_a_image_file_name   => row[23],:choice_a_image_content_type   => row[24],:choice_a_image_file_size   => row[25],:choice_a_image_updated_at   => row[26],:choice_b_image_file_name   => row[27],:choice_b_image_content_type   => row[28],:choice_b_image_file_size   => row[29],:choice_b_image_updated_at   => row[30],:choice_c_image_file_name   => row[31],:choice_c_image_content_type   => row[32],:choice_c_image_file_size   => row[33],:choice_c_image_updated_at   => row[34],:choice_d_image_file_name   => row[35],:choice_d_image_content_type   => row[36],:choice_d_image_file_size   => row[37],:choice_d_image_updated_at   => row[38])
		end
		puts "...end import question..."
  end
end