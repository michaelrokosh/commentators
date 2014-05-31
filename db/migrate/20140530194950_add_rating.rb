class AddRating < ActiveRecord::Migration
  def change
    add_column :news, :rating, :integer, default: 0
    add_column :fictions, :rating, :integer, default: 0
    add_column :stories, :rating, :integer, default: 0
    add_column :facts, :rating, :integer, default: 0
    add_column :images, :rating, :integer, default: 0
  end
end
