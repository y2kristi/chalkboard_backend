ActiveAdmin.register Result do
	permit_params :question_id, :student_id, :correct, :student_answer, :module_test,:subject, :number, :module_test_name
  index do
    selectable_column
    id_column
    column :question_id
    column :student_id
    column :correct
    column :student_answer
    column :module_test
    column :subject
    column :number
    column :module_test_name
    actions
  end
  filter :question_id
  filter :student_id
  filter :correct
  filter :student_answer
  filter :module_test
  filter :subject
  filter :number
  filter :module_test_name

  form do |f|
    f.inputs "Result Details" do
      f.input :question_id, as: :select, :collection => Question.all.map{ |question| [question.question, question.id]}, include_blank: false
      f.input :student_id, as: :select, :collection => Student.all.map{ |student| [student.email, student.id]}, include_blank: false
      f.input :correct
      f.input :student_answer
      f.input :module_test
      f.input :subject
      f.input :number
      f.input :module_test_name
    end
    f.actions
  end
end
