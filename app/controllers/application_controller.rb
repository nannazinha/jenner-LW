class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def members_index
    @members = Member.where(user: current_user)
  end
end
