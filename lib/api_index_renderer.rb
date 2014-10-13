class ApiIndexRenderer
  attr_reader :name, :link_ref, :method_type
  
  def initialize(name, link_ref, method_type)
    @name        = name
    @link_ref    = link_ref
    @method_type = method_type
  end
  
  class << self
    def passenger_api_index
      index_arr = []
      index_arr << ApiIndexRenderer.new("Signup", "sign_up", "POST")
      index_arr << ApiIndexRenderer.new("Login", "sing_in", "POST")
      index_arr << ApiIndexRenderer.new("Change password", "change_password", "POST")
      index_arr << ApiIndexRenderer.new("Forgot password", "forgot_password", "POST")
      index_arr << ApiIndexRenderer.new("Logout", "sing_out", "GET")
      index_arr
    end    
  end
end