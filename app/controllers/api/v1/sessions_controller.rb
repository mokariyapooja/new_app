class Api::V1::SessionsController < Api::V1::BaseController
  ##Filter
  before_action :define_current_user, only: [:logout, :change_password]
 
  ##sing_up 
  def register 
    @user = User.new(users_params)
    if @user.save
      @token = @user.authentication_tokens.build
      @token.save
    else
      render_json({:errors => @user.display_errors, :status => 404}.to_json)       
    end   
  end

  ##sing_in
  def login
    @valid_email = params[:email].present?
    @valid_password = params[:password].present?
    @user = User.authenticate_user_with_auth_token(params[:email],params[:password])
    if @user.present?
      @token = @user.authentication_tokens.build
      @token.save
      render :file => 'api/v1/sessions/register'   
    elsif !@valid_password && !@valid_email
      render_json({:errors => "Email and password is required",:status => 404}.to_json)  
    else
      render_json({:errors => User.invalid_credential, :status => 404}.to_json)
    end
  end

  ##sing_out
  def logout
    if @token.present?
      @token.destroy  
      render_json({:message => "Logout Successfully.!"}.to_json)
    else
      render_json({:errors => "No user found with authentication_token = #{params[:auth_token]}"}.to_json)
    end
  end

  ##forgot_password
  def forgot_password
  if params[:email].present?
    @user = User.find_by(email: params[:email])
      if @user.present?
        @user.send_reset_password_instructions
        render_json({:message => "You will receive an email with instructions about how to reset your password in a few minutes.", :status => 200}.to_json)
      else
        render_json({:errors => "No User found with email #{params[:email]}", :status => 404}.to_json)
      end
    else
      render_json({:errors => "email is required", :status => 404}.to_json)
    end 
  end
  
  ##change_password
  def change_password
    if params[:user][:current_password].present? && params[:user][:password].present?
      if @user.update_with_password(change_password_params)
        render_json({:message => "Your Password Successfully updated", :status => 200}.to_json)
      else
        render_json({:errors => @user.display_errors, :status => 404}.to_json)
      end
    else
      render_json({:errors => "Current Password and Password required", :status => 404}.to_json)
    end
  end

  private
  def users_params
    params.require(:user).permit(:email,:password,:password_confirmation,:first_name,:last_name,:mobile_number,:device_id,:device_type)
  end

  def change_password_params
    params.require(:user).permit(:current_password,:password,:password_confirmation)
  end
end
