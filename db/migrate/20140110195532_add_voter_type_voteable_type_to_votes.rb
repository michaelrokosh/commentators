class AddVoterTypeVoteableTypeToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :voter_type, :string
    add_column :votes, :voteable_type, :string
  end
end
