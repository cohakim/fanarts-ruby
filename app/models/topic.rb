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
  TOPIC_MABINOGI_RECOMMENDED   = 101
  TOPIC_MABINOGI_RETWEETED     = 102
  TOPIC_MABINOGISS_RECOMMENDED = 201
  TOPIC_MABINOGISS_RETWEETED   = 202
  TOPIC_FEZ_RETWEETED          = 302
  
  scope :topic, lambda {|topic| where(['topic = ?', topic]) }
end
