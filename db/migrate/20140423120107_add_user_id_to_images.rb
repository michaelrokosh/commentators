class AddUserIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :user_id, :integer, default: 3
  end
end
