require "test_helper"

class DeletePostPageTest < ActiveSupport::TestCase

def setup
  Post.create title: "testpost", body: 'Washington, D.C., formally
  the District of Columbia and commonly referred to as "Washington",
  "the District", or simply "D.C.", is the capital of the United States.
  The signing of the Residence Act on July 16, 1790, approved the creation
  of a capital district located along the Potomac River on the countrys
  East Coast.'
end



end
