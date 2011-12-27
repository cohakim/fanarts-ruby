require 'spec_helper'

describe Topic do
  let(:topics) { Array.new }
  let(:first)   { FactoryGirl.create(:topic, :topic => '200') }
  let(:middle)  { FactoryGirl.create(:topic, :topic => '300') }
  let(:last)    { FactoryGirl.create(:topic, :topic => '100') }

  context 'scope#topic' do
    before do
      topics << first << middle << last
    end
    subject { Topic.topic(300) }
    it { should == [middle] }
  end
end
