Rails.application.routes.draw do
  devise_for :students
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      devise_scope :students do
        post 'signup' => 'registrations#create'
        post 'signin' => 'sessions#create'
        delete 'signout' => 'sessions#destroy'
      end
      resources :results do
        get "student_guess/:question_id/:question_answer" => :student_guess, on: :collection
      end
      resources :reset_passwords
      resources :pins
      resources :resets
      resources :dashboard
      resources :questions do
	get "subject/:subject_id/:module_test" => :subject, on: :collection
	get "question_module/:subject_id/:module_test/:module_test_name/:number" => :question_module, on: :collection
      end
      resources :profiles do
        collection do
          post 'update_profile'
        end
      end
      end
  end
end
