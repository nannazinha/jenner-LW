class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :has_members

  def has_members
    if current_user
      unless current_user.members.count.zero?
        @master = current_user.members.find_by(category: "Titular")
      else
        redirect_to new_member_path
      end
    end
  end

  def about
  end
end
