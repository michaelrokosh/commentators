class Vote < ActiveRecord::Base
	belongs_to :voter, polymorphic: true
	belongs_to :voteable, polymorphic: true
	
	def self.record_vote(voter, voteable, rate, voter_type, voteable_type)
		new_vote = Vote.new
		new_vote.voter_id = voter.id
		new_vote.voteable_id = voteable.id
		new_vote.voter_type = voter_type
		new_vote.voteable_type = voteable_type
		new_vote.rate = rate
		voteable.rating += rate
		if new_vote.save
			voteable.save
		end
	end

	validates :voter_id,
  			uniqueness: { scope: :voteable_id, message: "Вы уже голосовали" }

end
