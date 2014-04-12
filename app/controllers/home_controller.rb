class HomeController < ApplicationController
  def index
  	@recent_images = Image.recent.paginate(:order => "created_at DESC", :page => params[:page], :per_page => 2)
  end
end
