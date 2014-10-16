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
      index_arr << ApiIndexRenderer.new("Update Profile", "update_profile", "POST")
      index_arr << ApiIndexRenderer.new("Create Car", "create_car", "POST")
      index_arr << ApiIndexRenderer.new("List Car", "list_car", "POST")
      index_arr << ApiIndexRenderer.new("Driver Signup", "sign_up", "POST")
      index_arr << ApiIndexRenderer.new("Driver Login", "sing_in", "POST")
      index_arr << ApiIndexRenderer.new("Driver Change password", "change_password", "POST")
      index_arr << ApiIndexRenderer.new("Driver Forgot password", "forgot_password", "POST")
      index_arr << ApiIndexRenderer.new("Driver Logout", "sing_out", "GET")
      index_arr << ApiIndexRenderer.new("Driver Update Profile", "update_profile", "POST")
      index_arr
    end    
  end
end