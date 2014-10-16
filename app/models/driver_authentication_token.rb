class DriverAuthenticationToken < ActiveRecord::Base
  ##callbacks
  before_create :generate_token
  
  ##relationship
  belongs_to :driver
  
  private
  def generate_token  
    token   = SecureRandom.hex
      while DriverAuthenticationToken.find_by(auth_token: token )
        token = SecureRandom.hex
      end
    self.auth_token = token
  end 
end
