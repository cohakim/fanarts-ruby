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
  TOPIC_PANGYA               = 400
  TOPIC_PANGYA_RETWEETED     = 420
  TOPIC_PANGYASS             = 500
  TOPIC_PANGYASS_RETWEETED   = 520
  TOPIC_PAPERMAN             = 600

  ############################################################################
  scope :topic, lambda {|topic| where(['topic = ?', topic]) }

end
