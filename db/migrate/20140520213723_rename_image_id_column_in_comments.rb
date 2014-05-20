class RenameImageIdColumnInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :image_id, :commentable_id
  end
end
