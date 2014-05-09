class HomeController < ApplicationController
  def index
  	@recent_images = Image.order('created_at DESC').where(godnota: true).paginate(:page => params[:page], :per_page => 3)
    if Rails.env.production?
      respond_to do |format|
        format.html.tablet # renders app/views/projects/show.html+tablet.erb
        format.html.phone
      end
    end
  end

  def dniwe
    @recent_images = Image.order('created_at DESC').where(godnota: false).paginate(:page => params[:page], :per_page => 3)
  end

  def best
    @comments = Comment.order('rating DESC').all.paginate(:page => params[:page], :per_page => 3)
  end
end
