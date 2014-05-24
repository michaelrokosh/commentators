class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.boolean :godnota, default: false
      t.string :title
      t.text :content

      t.timestamps
    end
    add_attachment :stories, :image 
  end
end
