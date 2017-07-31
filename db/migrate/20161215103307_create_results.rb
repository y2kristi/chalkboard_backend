class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :question_id
      t.integer :student_id
      t.boolean :correct
      t.string :student_answer
      t.string :module_test
      t.string :subject
      t.integer :number
      t.string :module_test_name

      t.timestamps
    end
  end
end
