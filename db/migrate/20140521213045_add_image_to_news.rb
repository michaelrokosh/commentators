class AddImageToNews < ActiveRecord::Migration
  def self.up
    add_attachment :news, :image
  end

  def self.down
    remove_attachment :news, :image
  end
end
