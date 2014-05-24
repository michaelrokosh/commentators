class CreateFictions < ActiveRecord::Migration
  def change
    create_table :fictions do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.boolean :godnota

      t.timestamps
    end
  end
end
