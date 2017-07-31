class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :choice_a
      t.string :choice_b
      t.string :choice_c
      t.string :choice_d
      t.string :answer
      t.string :module_test
      t.string :subject
      t.integer :number
      t.string :module_test_name
      t.integer :timer
      t.text :solution

      t.timestamps
    end
  end
end
