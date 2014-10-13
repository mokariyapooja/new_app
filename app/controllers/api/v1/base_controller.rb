class Api::V1::BaseController < ApplicationController
  #rescue_from ActionController::RoutingError,:with => :bad_record
  rescue_from ActiveRecord::RecordNotFound, :with => :bad_record
  #protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  protected
  def render_json(json)
    callback = params[:callback]
    response = begin
      if callback
        "#{callback}(#{json});"
      else
        json
      end
    end
    render({:content_type => :js, :text => response})
  end

  def bad_record
    render_json({:errors => "No Record Found!", :status => 404}.to_json)
  end

  def define_current_user
    @token = AuthenticationToken.find_by(auth_token: params[:auth_token])
    if @token.present?
      @user = User.find(@token.user_id)
      unless @user.present? 
        render_json(:errors => "No user found with this #{params[:auth_token]} auth token", :status => 404)
      end
    else
      render_json(:errors => "Invalid authtoken", :status => 404)
    end
  end  
end
