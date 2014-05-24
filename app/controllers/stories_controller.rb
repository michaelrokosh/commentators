class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = current_user.storys.create(story_params)

    if @story.save
      redirect_to '/dniwe'
    else
      render 'new'
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to @story
    else
      render 'edit'
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    respond_to do |format|
      format.html { redirect_to :root}
      format.json { head :ok }
      format.js
    end
  end

  def godnota
    @story = Story.find(params[:id])
    if current_user.admin?
      @story.godno
      redirect_to :back
    end
  end

  def index
    @recent_storys = Story.where(godnota: true).order('created_at DESC').all.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @story = Story.find(params[:id])

    if @story.comments.any?
      @top_comment = @story.comments.order("rating DESC, created_at ASC").first.content
    else
      @top_comment = 'Комментариев пока нет'
    end

    if params[:sort_by] == 'popular'
      @comments = @story.comments.paginate(page: params[:page], per_page: 5).order('rating DESC, created_at ASC')
    else
      @comments = @story.comments.paginate(page: params[:page], per_page: 5 ).order('created_at DESC')
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def story_params
      params.require(:story).permit(:image, :content, :title)
    end
end