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

FactoryGirl.define do
  factory :fan_art do
    context_id            FanArt::CONTEXT_MABINOGI
    sequence(:sequence)   {|n| "#{n}" }
    title                 'FanArt Title'
    author                'FanArt Author'
    created_at            { 3.days.ago }
    updated_at            { 3.days.ago }
  end
end
