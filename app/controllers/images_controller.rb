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
    redirect_to :root
  end

  def show
    @image = Image.find(params[:id])
    if @image.comments.any?
      @top_comment = @image.comments.order("rating DESC").first.content
    else
      @top_comment = 'Комметариев пока нет'
    end
  end

  private
    def image_params
      params.require(:image).permit(:url)
    end
end