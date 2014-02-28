require 'spec_helper'

describe Comment do
	it "should have content" do
		c = Comment.new(content: "Bla bla bla")
		c.content.should_not == nil
	end
end