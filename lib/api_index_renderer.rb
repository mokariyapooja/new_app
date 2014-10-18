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
      index_arr << ApiIndexRenderer.new("Signup"                ,"register"               ,"POST")
      index_arr << ApiIndexRenderer.new("Login"                 ,"login"                  ,"POST")
      index_arr << ApiIndexRenderer.new("Change password"       ,"change_password"        ,"POST")
      index_arr << ApiIndexRenderer.new("Forgot password"       ,"forgot_password"        ,"POST")
      index_arr << ApiIndexRenderer.new("Logout"                ,"logout"                 ,"GET")
      index_arr << ApiIndexRenderer.new("Update Profile"        ,"update_profile"         ,"POST")
      
      index_arr << ApiIndexRenderer.new("Create Car"             ,"create_car"            ,"POST")
      index_arr << ApiIndexRenderer.new("List Car"               ,"car_list"              ,"POST")
      
      index_arr << ApiIndexRenderer.new("Driver Signup"          ,"driver_register"       ,"POST")
      index_arr << ApiIndexRenderer.new("Driver Login"           ,"driver_login"          ,"POST")
      index_arr << ApiIndexRenderer.new("Driver Change password" ,"driver_change_password","POST")
      index_arr << ApiIndexRenderer.new("Driver Forgot password" ,"driver_forgot_password","POST")
      index_arr << ApiIndexRenderer.new("Driver Logout"          ,"driver_logout"         ,"GET")
      
      index_arr << ApiIndexRenderer.new("Driver Update Profile"  ,"driver_update_profile" ,"POST")
      index_arr << ApiIndexRenderer.new("Driver List"            ,"driver_list"           ,"POST")
      index_arr
    end    
  end
end