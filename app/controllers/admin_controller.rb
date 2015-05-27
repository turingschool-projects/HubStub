class AdminController < ApplicationController
  before_action :authorize
  def index
    if params[:status].nil? || params[:status] == "all"
      @orders = Order.sorted.paginate(:page => params[:page], :per_page => 50)
    else
      @orders = Order.sorted.where("status = ?", params[:status]).paginate(:page => params[:page], :per_page => 50)
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:status)
  end
end
