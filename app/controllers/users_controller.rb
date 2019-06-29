class UsersController < ApplicationController
  # before_action :authenticate_user!, ecxept: :index
  def index

  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
