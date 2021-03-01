class IslandsController < ApplicationController
  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.save

    redirect_to island_path(@island)
  end

  def island_params
    params.require(:island).permit(:name, :country, :description, :latitude, :longitude, :price_per_day, :area, :photo)
  end

  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end
end
