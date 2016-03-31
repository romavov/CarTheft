class CarsController < ApplicationController
  before_action :find_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:category].blank?
      @cars = Car.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @cars = Car.where(category_id: @category_id).order("created_at DESC")

      @cars = Car.all
      @hash = Gmaps4rails.build_markers(@cars) do |car, marker|
        marker.lat car.latitude
        marker.lng car.longitude
      end
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params.require(:car).permit!)
    @car.update_attribute(:user_id, current_user.id)
    if @car.save
      redirect_to @car
    else
      render "New"
    end
  end

  def edit
  end

  def update
    @car.update_attributes(:current_user.id => "user_id")
    if @car.update(cars_params)
      redirect_to @car
    else
      render "Edit"
    end
  end

  def destroy
    @car.destroy
    redirect_to root_path
  end

  private

  def cars_params
    params.require(:car).permit(:user_id, :category_id, :name, :number_auto, :year, :color, :city, :theft_date, :telephone, :money, :description)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
