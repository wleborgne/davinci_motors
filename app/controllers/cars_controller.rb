class CarsController < ApplicationController

  # GET /
  def index
    @cars = Car.all
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path,
        notice: "#{@car.year} #{@car.make} #{@car.model} created"
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :year, :model, :price)
  end
end
