class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:edit, :update, :show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def edit
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path(@restaurant)
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
