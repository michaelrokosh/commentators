class FictionsController < ApplicationController

  def new
    @fiction = Fiction.new
  end

  def create
    @fiction = current_user.fictions.create(fiction_params)

    if @fiction.save
      redirect_to '/dniwe'
    else
      render 'new'
    end
  end

  def edit
    @fiction = Fiction.find(params[:id])
  end

  def update
    @fiction = Fiction.find(params[:id])
    if @fiction.update(fiction_params)
      redirect_to @fiction
    else
      render 'edit'
    end
  end

  def destroy
    @fiction = Fiction.find(params[:id])
    @fiction.destroy
    respond_to do |format|
      format.html { redirect_to :root}
      format.json { head :ok }
      format.js
    end
  end

  def godnota
    @fiction = Fiction.find(params[:id])
    if current_user.admin?
      @fiction.godno
      redirect_to :back
    end
  end

  def index
    @recent_fictions = Fiction.where(godnota: true).order('created_at DESC').all.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @fiction = Fiction.find(params[:id])

    if @fiction.comments.any?
      @top_comment = @fiction.comments.order("rating DESC, created_at ASC").first.content
    else
      @top_comment = 'Комментариев пока нет'
    end

    if params[:sort_by] == 'popular'
      @comments = @fiction.comments.paginate(page: params[:page], per_page: 5).order('rating DESC, created_at ASC')
    else
      @comments = @fiction.comments.paginate(page: params[:page], per_page: 5 ).order('created_at DESC')
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def fiction_params
      params.require(:fiction).permit(:image, :content, :title)
    end
end