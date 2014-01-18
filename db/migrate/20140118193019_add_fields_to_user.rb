class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :url, :string
    add_column :users, :avatar_url, :string
    add_column :users, :avatar_big_url, :string
    add_column :users, :nickname, :string
  end
end
