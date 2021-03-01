class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    if @island.save
      redirect_to island_path(@island)
    else
      render :new
    end
  end

  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end

  def index_user
    @user_islands = current_user.islands
  end

  private

  def island_params
    params.require(:island).permit(:name, :country, :description, :latitude, :longitude, :price_per_day, :area, :photo)
  end

end
