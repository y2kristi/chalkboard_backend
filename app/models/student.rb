class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins
  has_many :results
  has_many :questions, through: :results


  # Authorization token for api sessions
  before_create :generate_auth_token!

  #--Function used to generate token for api authentication
  def generate_auth_token!
    begin

      self.activation_token = Devise.friendly_token
    end while self.class.exists?(activation_token: activation_token)
  end

end
