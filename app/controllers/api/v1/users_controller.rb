class Api::V1::UsersController < Api::V1::BaseController
  ##Filter
  before_action :define_current_user

  def update_profile
    if @user.update_attributes(update_params)
      render_json({:message => "your profile is updated" , :status => 200}.to_json)   
    else
      render_json({:errors => @user.display_errors, :status => 404}.to_json)
    end
  end

  private
  def update_params
    params.require(:user).permit(:first_name,:last_name,:mobile_number)
  end
end
