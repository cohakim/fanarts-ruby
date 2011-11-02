# == Schema Information
#
# Table name: fan_arts
#
#  id            :integer         not null, primary key
#  context_id    :integer         not null
#  sequence      :string(255)     not null
#  title         :string(255)
#  author        :string(255)
#  image_url     :string(255)
#  thumbnail_url :string(255)
#  published_at  :datetime
#  comment       :text
#  created_at    :datetime
#  updated_at    :datetime
#

class FanArt < ActiveRecord::Base
  ############################################################################
  CONTEXT_MABINOGI       = 100
  CONTEXT_MABINOGI_REC   = 110
  CONTEXT_MABINOGISS     = 200
  CONTEXT_MABINOGISS_REC = 210
  CONTEXT_FEZ            = 300
  
  ############################################################################
  paginates_per 20
  scope :newly, { :order => 'sequence desc' }
  scope :context, lambda {|context| where(['context_id = ?', context]) }
  scope :sequences, lambda{|sequences| where(['sequence in (?)', sequences]) }
  scope :random, { :order => 'RANDOM()' }

end
