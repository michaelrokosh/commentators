class AddRateToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :rate, :integer
  end
end
