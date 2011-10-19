# DATABASE MANAGER FOR MABINOGI FANART

require 'open-uri'
require "resolv-replace"
require 'timeout'
include ActionView::Helpers::TextHelper

class MDBM
  FANART_INDEX_URL = 'http://www.mabinogi.jp/6th/community/fanartBoardList.asp?p=%s'
  FANART_DETAIL_URL = 'http://www.mabinogi.jp/6th/community/fanartBoardContent.asp?ix=%s'
  SCREENSHOT_URL = ''

  def self.task_add_que_fully
    self.sequences(1, 2000).each do |sequence|
      if FanArt.find_by_context_id_and_sequence(FanArt::CONTEXT_MABINOGI, sequence).present?
        next
      end
      SequenceQue.find_or_create_by_context_id_and_sequence(
        :context_id => FanArt::CONTEXT_MABINOGI, :sequence => sequence
      )
    end
    true
  end
  
  def self.task_add_que_newly
    self.sequences.each do |sequence|
      if FanArt.find_by_context_id_and_sequence(FanArt::CONTEXT_MABINOGI, sequence).present?
        next
      end
      SequenceQue.find_or_create_by_context_id_and_sequence(
        :context_id => FanArt::CONTEXT_MABINOGI, :sequence => sequence
      )
    end
    true
  rescue => ex
    p ex.message
    Rails.logger.error(ex.message)
    false
  end
  
  def self.sequences(start = 1, last = 1)
    if start > last then p "invalid argument: start=#{start}, last=#{last}"; return false end
    
    sequences = Array.new
    page = start
    while (true) do
      request_url = FANART_INDEX_URL % page
      begin
        response = timeout(10){ open(request_url) }
      rescue TimeoutError
        p 'request time out: ' + request_url
        p 'last page: ' + page.to_s
        return false
      end

      if response.base_uri.to_s != request_url
        p 'last page: ' + (page - 1).to_s
        break
      end
      
      doc = Hpricot(response.read)
      links = (doc/'div.fanart-item-detail'/'div.'/:a).map{|a| a[:href] }.uniq
      new_sequences = links.map{|link| /ix=(\d+)/ =~ link; $1 }

      sequences = sequences | new_sequences
      
      if page >= last then p 'last page: ' + (page - 1).to_s; break end
      page += 1
    end
    sequences
  end
  
  def self.detail(seqence)
    if seqence.blank? then return false end
    
    request_url = FANART_DETAIL_URL % seqence
    begin
      response = timeout(10) { open(request_url) }
    rescue TimeoutError
      p 'request time out: ' + request_url
      return false
    end

    begin
      detail = Hpricot(response.read)
      title = (detail/'td.detail-title-txt').first.inner_html
      author = (detail/'#contributor-name').first.inner_html
      published_at = DateTime.parse((detail/'#contributor-date').first.inner_html + ' JST')
      image_url = (detail/'#news_img').first[:src]
      comment = strip_tags((detail/'#detail-main'/:p).first.inner_html)
    rescue
      p 'detail parse error: ' + request_url
      return false
    end
    
    { :title => title, :author => author, :published_at => published_at, 
      :image_url => image_url, :comment => comment, :seqence => seqence }
  end

end
