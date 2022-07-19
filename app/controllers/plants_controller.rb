class PlantsController < ApplicationController
  wrap_parameters format: []

  def index
    plants = Plant.all
    if plants
      render json: plants, except: [:created_at, :updated_at], status: :ok
    else
      render json: {error: "plants not found"}, status: :not_found
    end
  end

  def show
    plant = Plant.find(params[:id])
    if plant
      render json: plant, except: [:created_at, :updated_at], status: :ok
    else
      render json: {error: "plant not found"}, status: :not_found
    end
  end

  def create
    new_plant = Plant.create(params_plant)
    render json: new_plant, status: :created
  end

  private 
  def params_plant
    params.permit(:name, :image, :price)
  end
end
