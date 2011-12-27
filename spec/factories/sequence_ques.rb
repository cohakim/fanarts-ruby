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

FactoryGirl.define do
  factory :sequence_que do
    context_id            FanArt::CONTEXT_MABINOGI
    sequence(:sequence)   {|n| "#{n}" }
    error_count           0
    last_error            ''
    created_at            { 3.days.ago }
    updated_at            { 3.days.ago }
  end
end
