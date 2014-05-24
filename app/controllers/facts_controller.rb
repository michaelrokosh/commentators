class FactsController < ApplicationController

  def new
    @fact = Fact.new
  end

  def create
    @fact = current_user.facts.create(fact_params)

    if @fact.save
      redirect_to '/dniwe'
    else
      render 'new'
    end
  end

  def edit
    @fact = Fact.find(params[:id])
  end

  def update
    @fact = Fact.find(params[:id])
    if @fact.update(fact_params)
      redirect_to @fact
    else
      render 'edit'
    end
  end

  def destroy
    @fact = Fact.find(params[:id])
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to :root}
      format.json { head :ok }
      format.js
    end
  end

  def godnota
    @fact = Fact.find(params[:id])
    if current_user.admin?
      @fact.godno
      redirect_to :back
    end
  end

  def index
    @recent_facts = Fact.where(godnota: true).order('created_at DESC').all.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @fact = Fact.find(params[:id])

    if @fact.comments.any?
      @top_comment = @fact.comments.order("rating DESC, created_at ASC").first.content
    else
      @top_comment = 'Комментариев пока нет'
    end

    if params[:sort_by] == 'popular'
      @comments = @fact.comments.paginate(page: params[:page], per_page: 5).order('rating DESC, created_at ASC')
    else
      @comments = @fact.comments.paginate(page: params[:page], per_page: 5 ).order('created_at DESC')
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def fact_params
      params.require(:fact).permit(:image, :content, :title)
    end
end