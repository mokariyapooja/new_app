class Api::V1::Drivers::SessionsController < Api::V1::Drivers::BaseController 
  ##Filter
  before_action :define_current_driver, only: [:sing_out,:change_password]

  ##sing_up
  def driver_register
    @driver = Driver.new(drivers_params)
    if @driver.save
      @token_driver = @driver.driver_authentication_tokens.build
      @token_driver.save
    else
      render_json({:errors => @driver.display_errors, :status => 404}.to_json)       
    end   
  end

  ##sing_in
  def driver_login
    @valid_email = params[:email].present?
    @valid_password = params[:password].present?
    @driver = Driver.authenticate_driver_with_auth_token(params[:email],params[:password])
    if @driver.present?
      @token_driver = @driver.driver_authentication_tokens.build
      @token_driver.save
      render :file => 'api/v1/drivers/sessions/driver_register'   
    elsif !@valid_password && !@valid_email
      render_json({:errors => "Email and password is required",:status => 404}.to_json)  
    else
      render_json({:errors => Driver.invalid_credential, :status => 404}.to_json)
    end
  end

  ##sing_out
  def driver_logout
    if @token_driver.present?
     @token_driver.destroy  
      render_json({:message => "Logout Successfully!"}.to_json)
    else
      render_json({:errors => "No driver found with authentication_token = #{params[:driver_authentication_token]}"}.to_json)
    end
  end
    
  ##forgot_password
  def driver_forgot_password
  if params[:email].present?
    @driver = Driver.find_by(email: params[:email])
      if @driver.present?
        @driver.send_reset_password_instructions
        render_json({:message => "You will receive an email with instructions about how to reset your password in a few minutes.", :status => 200}.to_json)
      else
        render_json({:errors => "No driver found with email #{params[:email]}", :status => 404}.to_json)
      end
    else
      render_json({:errors => "email is required", :status => 404}.to_json)
    end 
  end
  
  ##change_password
  def driver_change_password
    if params[:driver][:current_password].present? && params[:driver][:password].present?
      if @driver.update_with_password(driver_change_password_params)
        render_json({:message => "Your Password Successfully updated", :status => 200}.to_json)
      else
        render_json({:errors => @driver.display_errors, :status => 404}.to_json)
      end
    else
      render_json({:errors => "Current Password and Password required", :status => 404}.to_json)
    end
  end

  private
  def drivers_params
    params.require(:driver).permit(:email,:password,:password_confirmation,:first_name,:last_name,:mobile_number,:device_id,:device_type)
  end

  def driver_change_password_params
    params.require(:driver).permit(:current_password,:password,:password_confirmation)
  end
end
