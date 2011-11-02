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

class Topic < ActiveRecord::Base
  serialize :sequences
  
  ############################################################################
  TOPIC_MABINOGI             = 100
  TOPIC_MABINOGI_REC         = 110
  TOPIC_MABINOGI_RETWEETED   = 120
  TOPIC_MABINOGISS           = 200
  TOPIC_MABINOGISS_REC       = 210
  TOPIC_MABINOGISS_RETWEETED = 220
  TOPIC_FEZ                  = 300
  TOPIC_FEZ_RETWEETED        = 320
  
  ############################################################################
  scope :topic, lambda {|topic| where(['topic = ?', topic]) }

end
