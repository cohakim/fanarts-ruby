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

    sequences = ActiveSupport::JSON.decode(
      Topic.find_by_topic(Topic::TOPIC_MABINOGI_RECOMMENDED).try(:sequences) || []
    )
    items = FanArt.context(FanArt::CONTEXT_MABINOGI).sequences(sequences).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end
  
  # def mabinogi_fa_retweeted
  # end
  
  def mabinogi_fa_random
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_MABINOGI).random.page(page)

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

    sequences = ActiveSupport::JSON.decode(
      Topic.find_by_topic(Topic::TOPIC_MABINOGISS_RECOMMENDED).try(:sequences) || []
    )
    items = FanArt.context(FanArt::CONTEXT_MABINOGISS).sequences(sequences).newly.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

  # def mabinogi_ss_retweeted
  # end
  
  def mabinogi_ss_random
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_MABINOGISS).random.page(page)

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

  # def mabinogi_ss_retweeted
  # end

  def fez_fa_random
    page  = params[:page]
    items = FanArt.context(FanArt::CONTEXT_FEZ).random.page(page)

    respond_to do |format|
      format.html { render :json => items }
      format.json { render :json => items }
    end
  end

end
