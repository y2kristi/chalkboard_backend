ActiveAdmin.register Student do

	permit_params :email, :password, :password_confirmation, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at, :activation_token,
      :password,:nickname,:first,:last,:age,:school,:grade,:island,:gender,:active

  index do
    selectable_column
    id_column
    column :email
    column :nickname
    column :first
    column :last
    column :age
    column :school
    column :grade
    column :island
    column :gender
    column :active
    column :last_sign_in_at
    column :activation_token
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
    actions
  end
  filter :email
  filter :nickname
  filter :first
  filter :last
  filter :age
  filter :school
  filter :grade
  filter :island
  filter :gender
  filter :active
  filter :created_at
  filter :updated_at
 
  form do |f|
    f.inputs "Student Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :nickname
      f.input :first
      f.input :last
      f.input :age
      f.input :school
      f.input :grade
      f.input :island
      f.input :gender
      f.input :active
 
    end
    f.actions
  end
end
