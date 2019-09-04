class LaboratoriesController < ApplicationController
  def index
    @laboratories = Laboratory.geocoded #returns flats with coordinates
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
end
