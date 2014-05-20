class SetCommentableTypeToComments < ActiveRecord::Migration
  def change
    Comment.update_all(commentable_type: "Image")
  end
end
