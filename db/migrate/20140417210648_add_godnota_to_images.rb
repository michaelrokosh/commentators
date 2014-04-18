class AddGodnotaToImages < ActiveRecord::Migration
  def change
    add_column :images, :godnota, :boolean, default: false
  end
end
