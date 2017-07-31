class AddColumnToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :nickname, :string
    add_column :students, :first, :string
    add_column :students, :last, :string
    add_column :students, :age, :integer
    add_column :students, :school, :string
    add_column :students, :grade, :integer
    add_column :students, :island, :string
    add_column :students, :remember_token, :string
    add_column :students, :gender, :string
    add_column :students, :activation_token, :string
    add_column :students, :active, :boolean
  end
end
