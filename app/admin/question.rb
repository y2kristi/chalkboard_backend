ActiveAdmin.register Question do
	permit_params :question, :choice_a , :choice_b ,:choice_c,:choice_d, :answer, :module_test , :subject , :number, :module_test_name, :timer, :solution, :image_file_name, :image_content_type, :image_file_size ,:image_updated_at, :image_solution_file_name, :image_solution_content_type, :image_solution_file_size, :image_solution_updated_at,:choice_a_image_file_name, :choice_a_image_content_type, :choice_a_image_file_size, :choice_a_image_updated_at,:choice_b_image_file_name, :choice_b_image_content_type,:choice_b_image_file_size, :choice_b_image_updated_at,:choice_c_image_file_name, :choice_c_image_content_type,:choice_c_image_file_size, :choice_c_image_updated_at, :choice_d_image_file_name, :choice_d_image_content_type,:choice_d_image_file_size,:choice_d_image_updated_at
  index do
    selectable_column
    id_column
    column :question
    column :choice_a
    column :choice_b
    column :choice_c
    column :choice_d
    column :answer
    column :module_test
    column :subject 
    column :number
    column :module_test_name
    column :timer
    column :solution
    column :image_file_name
    column :image_content_type
    column :image_file_size
    column :image_updated_at
    column :image_solution_file_name
    column :image_solution_content_type
    column :image_solution_file_size
    column :image_solution_updated_at
    column :choice_a_image_file_name
    column :choice_a_image_content_type
    column :choice_a_image_file_size
    column :choice_a_image_updated_at
    column :choice_b_image_file_name
    column :choice_b_image_content_type
    column :choice_b_image_file_size
    column :choice_b_image_updated_at
    column :choice_c_image_file_name
    column :choice_c_image_content_type
    column :choice_c_image_file_size
    column :choice_c_image_updated_at
    column :choice_d_image_file_name
    column :choice_d_image_content_type
    column :choice_d_image_file_size
    column :choice_d_image_updated_at
    actions
  end
  filter :question
  filter :choice_a
  filter :choice_b
  filter :choice_c
  filter :choice_d
  filter :answer
  filter :module_test
  filter :subject 
  filter :number
  filter :module_test_name
  filter :timer
  filter :solution

  form do |f|
    f.inputs "Question Details" do
      
       f.input :question
       f.input :choice_a
       f.input :choice_b
       f.input :choice_c
       f.input :choice_d
       f.input :answer
       f.input :module_test
       f.input :subject 
       f.input :number
       f.input :module_test_name
       f.input :timer
       f.input :solution
       f.input :image_file_name
       f.input :image_content_type
       f.input :image_file_size
       f.input :image_updated_at
       f.input :image_solution_file_name
       f.input :image_solution_content_type
       f.input :image_solution_file_size
       f.input :image_solution_updated_at
       f.input :choice_a_image_file_name
       f.input :choice_a_image_content_type
       f.input :choice_a_image_file_size
       f.input :choice_a_image_updated_at
       f.input :choice_b_image_file_name
       f.input :choice_b_image_content_type
       f.input :choice_b_image_file_size
       f.input :choice_b_image_updated_at
       f.input :choice_c_image_file_name
       f.input :choice_c_image_content_type
       f.input :choice_c_image_file_size
       f.input :choice_c_image_updated_at
       f.input :choice_d_image_file_name
       f.input :choice_d_image_content_type
       f.input :choice_d_image_file_size
       f.input :choice_d_image_updated_at
    end
    f.actions
  end
end
