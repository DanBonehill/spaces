class LocationsController < ApplicationController
  def new
    @location = Location.new
    @location.build_address
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location Created"
      redirect_to @location
    else
      flash[:danger] = "Location could not be created. See below errors."
      render :new
    end
  end

  def show
  end

  private

  def location_params
    params.require(:location).permit(:name, :point_of_contact, :contact_number,
                                      :max_occupancy, :size, :price, :description,
                                      address_attributes: [:line_1, :line_2, :city,
                                                            :postcode],
                                      :features => [])
  end
end
