class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_island, only: [:edit, :update, :show, :destroy]

  def index
    @islands = Island.all
  end

  def show
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to island_path(@island)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @island.update(island_params)
      redirect_to user_islands_path
    else
      render :edit
    end
  end

  def destroy
    @island.destroy
    if current_user.islands != []
      redirect_to user_islands_path
    else
      redirect_to root_path
    end
  end

  def index_user
    @user_islands = current_user.islands
  end

  private

  def find_island
    @island = Island.find(params[:id])
  end

  def island_params
    params.require(:island).permit(:name, :country, :description, :latitude, :longitude, :price_per_day, :area, :photo)
  end

end
