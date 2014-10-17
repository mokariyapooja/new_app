class Api::V1::Drivers::BaseController < Api::V1::BaseController
  
  protected
  def define_current_driver
    @token_driver = DriverAuthenticationToken.find_by(auth_token: params[:auth_token])
    if @token_driver.present?
      @driver = Driver.find(@token_driver.driver_id)
      unless @driver.present? 
        render_json({:errors => "No user found with this #{params[:auth_token]} auth token", :status => 404}.to_json)
      end
    else
      render_json({:errors => "Invalid authtoken", :status => 404}.to_json)
    end
  end  
end
