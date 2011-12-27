require 'spec_helper'

describe FanArt do
  let(:fanarts) { Array.new }
  let(:first)   { FactoryGirl.create(:fan_art, :sequence => '100', :context_id => '200') }
  let(:middle)  { FactoryGirl.create(:fan_art, :sequence => '300', :context_id => '300') }
  let(:last)    { FactoryGirl.create(:fan_art, :sequence => '500', :context_id => '100') }

  context 'scope#newly' do
    before do
      fanarts << last << first << middle
    end
    subject { FanArt.newly }
    it { should == fanarts.sort_by(&:sequence).reverse }
  end

  context 'scope#context' do
    before do
      fanarts << first << middle << last
    end
    subject { FanArt.context(200) }
    it { should == [first] }
  end

  context 'scope#contexts' do
    before do
      fanarts << first << middle << last
    end
    subject { FanArt.contexts([200, 300]) }
    it { should == [first, middle] }
  end

  context 'scope#sequences' do
    before do
      fanarts << first << middle << last
    end
    subject { FanArt.sequences([300, 500]) }
    it { should == [middle, last] }
  end

  context 'scope#ramdom' do
    let(:rands) { Array.new }
    before do
      fanarts << first << middle << last
    end
    subject { (1..30).map{ FanArt.random.first } }
    it { should include(first) }
    it { should include(middle) }
    it { should include(last) }
  end

end
