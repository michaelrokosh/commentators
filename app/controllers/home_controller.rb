class HomeController < ApplicationController
  def index
  	@recent_images = Image.where(godnota: true).paginate(order: "created_at DESC", page: params[:page], per_page: 3)
  end

  def dniwe
    @recent_images = Image.where(godnota: false).paginate(order: "created_at DESC", page: params[:page], per_page: 3)
  end

  def best
    @comments = Comment.all.paginate(order: "rating DESC", page: params[:page], per_page: 3)
  end
end
