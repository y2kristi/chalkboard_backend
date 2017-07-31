class AddStudentId < ActiveRecord::Migration[5.0]
  def change
	add_reference :pins, :student, index: true
  end
end
