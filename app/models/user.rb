class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ##relationship
  has_many :authentication_tokens, :dependent => :destroy

  ##validations
  validates_uniqueness_of :email

  ##class
  class << self
    def authenticate_user_with_auth_token(email,password)
      return nil unless  email.present? or password.present?
        u = User.find_by_email(email)
       (u.present? && u.valid_password?(password)) ? u : nil    
    end 
  end
  
  ##for error masseges
  def display_errors
    self.errors.full_messages.join(', ')
  end
end
