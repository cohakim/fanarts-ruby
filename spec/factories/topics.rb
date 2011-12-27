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


FactoryGirl.define do
  factory :topic do
    topic                 FanArt::CONTEXT_MABINOGI
    sequences             ''
    created_at            { 3.days.ago }
    updated_at            { 3.days.ago }
  end
end
