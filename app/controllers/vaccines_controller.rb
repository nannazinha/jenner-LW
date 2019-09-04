class VaccinesController < ApplicationController
  before_action :set_vaccine, only: [:show]

  def show
    # .where = vaccine
    @laboratories = Laboratory.geocoded #returns labs with coordinates
    @markers = @laboratories.map do |laboratory|
      if laboratory.category == "private"
        {
          lat: laboratory.latitude,
          lng: laboratory.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { laboratory: laboratory }),
          image_url: helpers.asset_url('icon_blue.png')
        }
      else
        {
          lat: laboratory.latitude,
          lng: laboratory.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { laboratory: laboratory }),
          image_url: helpers.asset_url('icon_red.png')
        }
      end
    end
  end

  private

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end
end
