# == Schema Information
#
# Table name: fan_arts
#
#  id            :integer         not null, primary key
#  context_id    :integer         not null
#  sequence      :string(255)     not null
#  title         :string(255)
#  author        :string(255)
#  url           :string(255)
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
  CONTEXT_PANGYA         = 400
  CONTEXT_PANGYASS       = 500
  CONTEXT_PAPERMAN       = 600
  CONTEXT_CGF            = 700
  CONTEXT_LATELE         = 800
  CONTEXT_MAPLE_STORY    = 900

  ############################################################################
  CONTEXT_MABINOGI_ALL    = [CONTEXT_MABINOGI, CONTEXT_MABINOGI_REC]
  CONTEXT_MABINOGISS_ALL  = [CONTEXT_MABINOGISS, CONTEXT_MABINOGISS_REC]
  CONTEXT_FEZ_ALL         = [CONTEXT_FEZ]
  CONTEXT_PANGYA_ALL      = [CONTEXT_PANGYA]
  CONTEXT_PANGYASS_ALL    = [CONTEXT_PANGYASS]
  CONTEXT_PAPERMAN_ALL    = [CONTEXT_PAPERMAN]
  CONTEXT_CGF_ALL         = [CONTEXT_CGF]
  CONTEXT_LATELE_ALL      = [CONTEXT_LATELE]
  CONTEXT_MAPLE_STORY_ALL = [CONTEXT_MAPLE_STORY]
  CONTEXT_ALL             = CONTEXT_MABINOGI_ALL | CONTEXT_MABINOGISS_ALL | CONTEXT_FEZ_ALL | \
                            CONTEXT_PANGYA_ALL | CONTEXT_PANGYASS_ALL | CONTEXT_PAPERMAN_ALL | \
                            CONTEXT_LATELE_ALL | CONTEXT_CGF_ALL | CONTEXT_MAPLE_STORY_ALL

  ############################################################################
  CONTEXT = { :mabinogi => CONTEXT_MABINOGI, :mabinogi_rec => CONTEXT_MABINOGI_REC,
              :mabinogiss => CONTEXT_MABINOGISS , :mabinogiss_rec => CONTEXT_MABINOGISS_REC,
              :fez => CONTEXT_FEZ, :pangya => CONTEXT_PANGYA, :pangyass => CONTEXT_PANGYASS,
              :paperman => CONTEXT_PAPERMAN, :cgf => CONTEXT_CGF, :latele => CONTEXT_LATELE,
              :maple_story => CONTEXT_MAPLE_STORY,
              :all => CONTEXT_ALL }

  ############################################################################
  paginates_per 20
  scope :newly, { :order => 'cast(sequence as SIGNED) desc' }
  scope :context, lambda {|context| where(['context_id = ?', context]) }
  scope :contexts, lambda {|contexts| where(['context_id in (?)', contexts]) }
  scope :sequences, lambda{|sequences| where(['sequence in (?)', sequences]) }
  scope :random, { :order => 'RAND()' }

end
