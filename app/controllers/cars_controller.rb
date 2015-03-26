class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update]
  
  # GET /
  def index
    @cars = Car.all
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path,
        notice: "#{@car.year} #{@car.make} #{@car.model} created"
    end
  end
  
  # PUT/PATCH /cars/1
  def update
    if @car.update(car_params)
      redirect_to cars_path, 
        notice: "#{@car.year} #{@car.make} #{@car.model} created"
end
  end
  
  private

  def car_params
    params.require(:car).permit(:make, :year, :model, :price)
  end
  
  def set_car
    @car = Car.find(params[:id])
  end
end
