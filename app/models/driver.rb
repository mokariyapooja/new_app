class Driver < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ##relationship
  has_many :driver_authentication_tokens, :dependent => :destroy
  
  ##validations 
  validates_format_of :mobile_number, 
                      :with => /\A[0-9]{10,15}\Z/,:maximum =>15,:minimum =>10
                      
  ##class
  class << self
    def authenticate_driver_with_auth_token(email,password)
      return nil unless  email.present? or password.present?
        d = Driver.find_by_email(email)
       (d.present? && d.valid_password?(password)) ? d : nil    
    end

    def invalid_credential
      "Email or Password is not valid"
    end
  end
   
  ##for error masseges
  def display_errors
    self.errors.full_messages.join(', ')
  end
end
