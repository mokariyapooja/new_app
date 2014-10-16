class Api::V1::Drivers::DriversController < Api::V1::Drivers::BaseController 
  ##Filter
  before_action :define_current_driver

  def update_profile
    if @driver.update_attributes(update_params)
      render_json({:message => "your profile is updated" , :status => 200}).to_json   
    else
      render_json({:errors => @driver.display_errors, :status => 404}).to_json
    end
  end

  private
  def update_params
    params.require(:driver).permit(:first_name,:last_name,:mobile_number)
  end
end
