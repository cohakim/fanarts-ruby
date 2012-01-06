require 'spec_helper'

describe API::MapleStory do
  describe '#sequences' do
    context 'first page' do
      let(:start) { 1 }
      let(:last)  { 1 }
      subject { API::MapleStory.new.sequences(start, last) }
      it { should be_a_kind_of Array }
      it { should have_at_least(1).sequences }
    end
  end

  context '#detail' do
    let(:sequence) { '654651' }
    subject { API::MapleStory.new.detail(sequence) }
    it { should be_a_kind_of Hash }
    its([:title])        { should_not be_empty }
    its([:author])       { should_not be_empty }
    its([:published_at]) { should_not be_nil }
    its([:comment])      { should_not be_empty }
    its([:url])          { should_not be_empty }
    its([:image_url])    { should_not be_empty }
    its([:sequence])     { should_not be_empty }
  end
end
