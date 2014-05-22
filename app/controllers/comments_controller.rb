class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @commentable = find_commentable
    @comment = current_user.comments.create(comment_params)
    redirect_to :back
  end

  def destroy
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end
  
  def vote_up
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
    Vote.record_vote(current_user, @comment, 1, 'User', 'Comment')
    redirect_to :back
  end

  def vote_down
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
    Vote.record_vote(current_user, @comment, -1, 'User', 'Comment')
    redirect_to :back
  end
  private
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
    end
end