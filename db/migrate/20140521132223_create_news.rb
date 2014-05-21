class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.boolean :godnota, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
