class CarsController < ApplicationController
  before_action :find_car, only: [:edit, :update]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} updated"
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} created"
  end

  private
  def car_params
    params.require(:car).permit(:make, :year, :model, :price)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
