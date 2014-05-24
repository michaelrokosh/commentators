class NewsController < ApplicationController

  def new
    @news = News.new
  end

  def create
    @news = current_user.news.create(news_params)

    if @news.save
      redirect_to '/dniwe'
    else
      render 'new'
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to @news
    else
      render 'edit'
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    respond_to do |format|
      format.html { redirect_to :root}
      format.json { head :ok }
      format.js
    end
  end

  def godnota
    @news = News.find(params[:id])
    if current_user.admin?
      @news.godno
      redirect_to :back
    end
  end

  def index
    @recent_news = News.where(godnota: true).order('created_at DESC').all.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @news = News.find(params[:id])

    if @news.comments.any?
      @top_comment = @news.comments.order("rating DESC, created_at ASC").first.content
    else
      @top_comment = 'Комментариев пока нет'
    end

    if params[:sort_by] == 'popular'
      @comments = @news.comments.paginate(page: params[:page], per_page: 5).order('rating DESC, created_at ASC')
    else
      @comments = @news.comments.paginate(page: params[:page], per_page: 5 ).order('created_at DESC')
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def news_params
      params.require(:news).permit(:image, :content, :title)
    end
end