require 'spec_helper'

# scope :context, lambda {|context| where(['context_id = ?', context]) }
# scope :broken_ques, lambda {|context| where('error_count > 3') }
# scope :not_broken_ques, lambda {|context| where('error_count <= 3') }

describe SequenceQue do
  let(:ques)    { Array.new }
  let(:first)   { FactoryGirl.create(:sequence_que, :sequence => '100', :context_id => '200', :error_count => 0) }
  let(:middle)  { FactoryGirl.create(:sequence_que, :sequence => '300', :context_id => '300', :error_count => 3) }
  let(:last)    { FactoryGirl.create(:sequence_que, :sequence => '500', :context_id => '100', :error_count => 4) }

  context 'scope#context' do
    before do
      ques << first << middle << last
    end
    subject { SequenceQue.context(200) }
    it { should == [first] }
  end

  context 'scope#broken_ques' do
    before do
      ques << first << middle << last
    end
    subject { SequenceQue.broken_ques }
    it { should == [last] }
  end

  context 'scope#not_broken_ques' do
    before do
      ques << first << middle << last
    end
    subject { SequenceQue.not_broken_ques }
    it { should == [first, middle] }
  end

end
