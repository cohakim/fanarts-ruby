require 'spec_helper'

describe ArtsController do
  describe 'GET mabinogi_fa_newly' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGI) }
        get :mabinogi_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGI) }
        get :mabinogi_fa_newly, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :mabinogi_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET mabinogi_fa_recommended' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGI_REC) }
        get :mabinogi_fa_recommended, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGI_REC) }
        get :mabinogi_fa_recommended, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :mabinogi_fa_recommended, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET mabinogi_fa_random' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGI_REC) }
        get :mabinogi_fa_random, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGI_REC) }
        get :mabinogi_fa_random, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :mabinogi_fa_random, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET mabinogi_ss_newly' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGISS) }
        get :mabinogi_ss_newly, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGISS) }
        get :mabinogi_ss_newly, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :mabinogi_ss_newly, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET mabinogi_ss_recommended' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGISS_REC) }
        get :mabinogi_ss_recommended, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGISS_REC) }
        get :mabinogi_ss_recommended, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :mabinogi_ss_recommended, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET mabinogi_ss_random' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGISS) }
        get :mabinogi_ss_random, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_MABINOGISS) }
        get :mabinogi_ss_random, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :mabinogi_ss_random, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET fez_fa_newly' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_FEZ) }
        get :fez_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_FEZ) }
        get :fez_fa_newly, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :fez_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET fez_fa_random' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_FEZ) }
        get :fez_fa_random, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_FEZ) }
        get :fez_fa_random, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :fez_fa_random, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET pangya_fa_newly' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PANGYA) }
        get :pangya_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PANGYA) }
        get :pangya_fa_newly, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :pangya_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET pangya_fa_random' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PANGYA) }
        get :pangya_fa_random, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PANGYA) }
        get :pangya_fa_random, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :pangya_fa_random, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET pangya_ss_newly' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PANGYASS) }
        get :pangya_ss_newly, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PANGYASS) }
        get :pangya_ss_newly, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :pangya_ss_newly, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET pangya_ss_random' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PANGYASS) }
        get :pangya_ss_random, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PANGYASS) }
        get :pangya_ss_random, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :pangya_ss_random, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET paperman_fa_newly' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PAPERMAN) }
        get :paperman_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PAPERMAN) }
        get :paperman_fa_newly, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :paperman_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET paperman_fa_random' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PAPERMAN) }
        get :paperman_fa_random, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_PAPERMAN) }
        get :paperman_fa_random, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :paperman_fa_random, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET cgf_fa_newly' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_CGF) }
        get :cgf_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_CGF) }
        get :cgf_fa_newly, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :cgf_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET cgf_fa_random' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_CGF) }
        get :cgf_fa_random, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_CGF) }
        get :cgf_fa_random, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :cgf_fa_random, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET latele_fa_newly' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_LATELE) }
        get :latele_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_LATELE) }
        get :latele_fa_newly, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :latele_fa_newly, :page => 1
      end
      it { response.should be_success }
    end
  end

  describe 'GET latele_fa_random' do
    context 'first' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_LATELE) }
        get :latele_fa_random, :page => 1
      end
      it { response.should be_success }
    end
    context 'out of bounds' do
      before do
        25.times{ FactoryGirl.create(:fan_art, :context_id => FanArt::CONTEXT_LATELE) }
        get :latele_fa_random, :page => 999
      end
      it { response.should be_success }
    end
    context 'empty' do
      before do
        get :latele_fa_random, :page => 1
      end
      it { response.should be_success }
    end
  end

end
