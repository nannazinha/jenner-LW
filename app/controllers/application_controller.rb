class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # @master = current_user.members.find_by(category: "0")
end
