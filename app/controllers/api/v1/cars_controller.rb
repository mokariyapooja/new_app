class Api::V1::CarsController < Api::V1::BaseController
 
  ##create cars
  def create_car
    @car = Car.create(car_params)
    if @car.save
      Rails.logger.debug "===========#{@car.inspect}============"
      name = @car.name
      Rails.logger.debug "===========#{name.inspect}============"
      render :file => 'api/v1/cars/show'            
    else
      render_json({:errors => @car.display_errors, :status => 404}.to_json)   
    end
  end

  ##list of cars
  def car_list
    @cars = Car.all
    if @cars.present?
      Rails.logger.debug "===========#{@cars.inspect}============"
      render :file => 'api/v1/cars/index'
    else
      render_json({:errors => "No cars yet.!", :status => 404}.to_json)
    end   
  end

  private
  def car_params
    params.require(:car).permit(:name,:total_passenger,:total_luggage)
  end
end
