class Api::V1::CarsController < Api::V1::BaseController
 
  ##Filter
  before_action :define_current_user, only: [:car_list]

  ##create cars
  def create_car
    @car = Car.create(car_params)
    if @car.save
      name = @car.name
      render :file => 'api/v1/cars/show'            
    else
      render_json({:errors => @car.display_errors, :status => 404}.to_json)   
    end
  end

  ##list of cars
  def car_list
    @cars = Car.all
    if @cars.present?
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
