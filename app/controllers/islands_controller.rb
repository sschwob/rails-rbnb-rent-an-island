class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_island, only: [:edit, :update, :show, :destroy]

  def index
    if params[:query].present?
      @islands = Island.search_by_name_country_or_price_per_day(params[:query])
      @islands_all = Island.all

      if @islands.empty?
        @markers = markers(@islands_all)
      else
        @markers = markers(@islands)
      end

    else
      @islands = Island.all
      @markers = markers(@islands)
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to island_path(@island), notice: "Island was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @island.update(island_params)
      redirect_to user_islands_path, notice: "Island was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @island.destroy
    if current_user.islands != []
      redirect_to user_islands_path, notice: "Island was successfully deleted"
    else
      redirect_to root_path, notice: "Island was successfully deleted"
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
    params.require(:island).permit(:name, :country, :description, :latitude, :longitude, :price_per_day, :area, photos: [])
  end

  def markers(islands)
    islands.map do |island|
      {
        lat: island.latitude,
        lng: island.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { island: island }),
        image_url: helpers.asset_url('missing_img')
      }
    end
  end
end
