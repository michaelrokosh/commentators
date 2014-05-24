class AddImageToFiction < ActiveRecord::Migration
  def self.up
    add_attachment :fictions, :image
  end

  def self.down
    remove_attachment :fictions, :image
  end
end
