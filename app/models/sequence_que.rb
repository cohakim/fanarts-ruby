# == Schema Information
#
# Table name: sequence_ques
#
#  id          :integer         not null, primary key
#  context_id  :integer         not null
#  sequence    :string(255)     not null
#  error_count :integer         default(0)
#  last_error  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class SequenceQue < ActiveRecord::Base
  default_scope where('error_count <= 3')
  scope :context, lambda {|context| where(['context_id = ?', context]) }
  scope :broken_ques, lambda {|context| where('error_count > 3') }
end
