class AddImageRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :image, index: true
  end
end
