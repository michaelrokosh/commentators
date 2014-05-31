class Vote < ActiveRecord::Base
	belongs_to :voter, polymorphic: true
	belongs_to :voteable, polymorphic: true
	before_save :change_karma

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
      puts "Fuck yeah!"
    else
      puts "Fuck no! :("
		end
	end

	validates :voter_id,
  			uniqueness: { scope: [:voteable_type, :voteable_id], message: "Вы уже голосовали" }

  	private

  	def change_karma
      if voteable.class.name == "Comment"
  		  voteable.user.karma += rate.to_f/10.0
      else
        voteable.user.karma += rate.to_f
      end
      if voteable.user.save
        puts "Yeah bitch!"
      else
        puts "Fuck bitch! :("
        puts voteable.user.errors.messages
      end
  	end
end
