class HomeController < ApplicationController
  def index
  	@recent_images = Image.order('created_at DESC').where(godnota: true).paginate(:page => params[:page], :per_page => 3)
  end

  def dniwe
    @recent_images = Image.order('created_at DESC').where(godnota: false).paginate(:page => params[:page], :per_page => 3)
  end

  def best
    @comments = Comment.order('rating DESC').all.paginate(:page => params[:page], :per_page => 3)
  end
end
