class LocationsController < ApplicationController
  before_action :set_location, only: [:add_images, :show, :update]

  def new
    @location = Location.new
    @location.build_address
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location Created"
      redirect_to add_images_location_path(@location)
    else
      flash[:danger] = "Location could not be created. See below errors."
      render :new
    end
  end

  def show
    if @location.images == []
      logger.info("====This location does not have any images====")
      @default_url = ActionController::Base.helpers.asset_path('missing_location.png')
    end
  end

  def update
    if @location.update(location_params)
      flash[:success] = "Images Uploaded"
      redirect_to @location
    else

    end
  end

  def add_images
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :point_of_contact, :contact_number,
                                      :max_occupancy, :size, :price, :description,
                                      address_attributes: [:line_1, :line_2, :city,
                                                            :postcode],
                                      images_attributes: [:image_pic, :caption, :location_id],
                                      feature_ids: [])
  end
end
