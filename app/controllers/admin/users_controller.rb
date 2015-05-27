class Admin::UsersController < ApplicationController
  before_action :authorize

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 50)
    #@users = User.order(:full_name).paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
    @user_events = @items.group_by { |item| item.event }
  end

  def suspend_user
    User.find(params[:id]).suspend
    redirect_to admin_users_path
  end

  def unsuspend_user
    User.find(params[:id]).unsuspend
    redirect_to admin_users_path
  end
end
