class LaboratoriesController < ApplicationController
  def index
    @laboratories = Laboratory.geocoded #returns flats with coordinates
    @markers = @laboratories.map do |laboratory|
      {
        lat: laboratory.latitude,
        lng: laboratory.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { laboratory: laboratory })
      }
    end
  end
end
