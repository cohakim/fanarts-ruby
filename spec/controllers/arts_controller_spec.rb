require 'spec_helper'

describe ArtsController do

  describe 'GET mabinogi_fa_newly' do
    before do
      get :mabinogi_fa_newly
    end

    # ページが1の場合
    # ページの指定がなかった場合
    # 最後のページの場合
    # ページ数が最終ページを超えていた場合
    # アイテム数が0件だった場合
  end
end
