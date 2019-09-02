class MembersController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_member, only: :show

  def index
    @members = Member.where(user_id: @user.id)
     end

  def show; end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
