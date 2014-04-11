class ImagesController < ApplicationController

	def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to @image
    else
      render 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to :root}
      format.json { head :ok }
      format.js
    end
  end

  def show
    @image = Image.find(params[:id])
    @top_comment = @image.comments.order("rating DESC").first
    if params[:sort_by] == 'popular'
      @comments = @image.comments.paginate(:order => "rating DESC", :page => params[:page], :per_page => 3)
    else
      @comments = @image.comments.paginate(:order => "created_at desc", :page => params[:page], :per_page => 3)
    end
  end

  private
    def image_params
      params.require(:image).permit(:url)
    end
end