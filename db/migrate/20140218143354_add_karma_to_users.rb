class AddKarmaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karma, :decimal, default: 0.0
  end
end
