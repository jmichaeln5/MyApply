class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to(current_user)
  end

  def show
    @user = User.find(params[:id])
    @user_jobs = @user.jobs

    redirect_to(root_url) unless current_user.id == @user.id
  end

end
