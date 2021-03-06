class ArtsController < ApplicationController
  def mabinogi_fa_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_MABINOGI).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def mabinogi_fa_recommended
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_MABINOGI_REC).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def mabinogi_fa_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_MABINOGI_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def mabinogi_ss_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_MABINOGISS).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def mabinogi_ss_recommended
    page  = params[:page]

    items = FanArt.context(FanArt::CONTEXT_MABINOGISS_REC).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def mabinogi_ss_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_MABINOGISS_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def fez_fa_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_FEZ).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def fez_fa_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_FEZ_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def pangya_fa_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_PANGYA).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def pangya_fa_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_PANGYA_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def pangya_ss_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_PANGYASS).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def pangya_ss_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_PANGYASS_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def paperman_fa_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_PAPERMAN).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def paperman_fa_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_PAPERMAN_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def cgf_fa_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_CGF).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def cgf_fa_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_CGF_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def latele_fa_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_LATELE).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def latele_fa_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_LATELE_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def maple_story_fa_newly
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_MAPLE_STORY).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  def maple_story_fa_random
    page  = params[:page]
    items = FanArt.contexts(FanArt::CONTEXT_MAPLE_STORY_ALL).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

end
