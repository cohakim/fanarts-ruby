# == Schema Information
#
# Table name: topics
#
#  id         :integer         not null, primary key
#  topic      :integer         not null
#  sequences  :text
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
