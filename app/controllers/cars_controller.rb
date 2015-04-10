class CarsController < ApplicationController
  before_action :find_car, only: [:edit, :update, :claim]

  def index
    @cars = Car.where(user_id: nil).all
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  def claim
    @car.user = current_user
    if @car.save
      redirect_to root_path,
        notice: "#{@car.make} #{@car.model} has been moved to your inventory."
    end
  end

  #  def update
  #    @car.update(car_params)
  #    redirect_to cars_path,
  #      notice: "#{@car.year} #{@car.make} #{@car.model} updated"
  #  end

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
        notice: "#{@car.year} #{@car.make} #{@car.model} updated"
    end
  end

  private

  private
  def car_params
    params.require(:car).permit(:make, :year, :model, :price)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
