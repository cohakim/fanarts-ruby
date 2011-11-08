# API FOR MABINOGI RECOMMENDED FANART

require 'open-uri'
require "resolv-replace"
require 'timeout'
include ActionView::Helpers::TextHelper

class API::MabinogiRec
  INDEX_URL = 'http://www.mabinogi.jp/6th/community/fanartBoardList.asp?sv=re&p=%s'
  DETAIL_URL = 'http://www.mabinogi.jp/6th/community/fanartBoardContent.asp?sv=re&ix=%s'
  
  def sequences(start = 1, last = 1)
    sequences = Array.new
    page = start
    while (true) do
      if page == start || page % 100 == 0 then p 'processing: ' + page.to_s end

      request_url = INDEX_URL % page
      begin
        response = timeout(10){ open(request_url) }
      rescue TimeoutError
        p 'request time out: ' + request_url
        raise 'request time out: ' + request_url
      end

      if response.base_uri.to_s != request_url
        p 'end page touched: ' + (page - 1).to_s
        break
      end

      doc = Hpricot(response.read)
      links = (doc/'div.fanart-item-detail'/'div.'/:a).map{|a| a[:href] }.uniq
      new_sequences = links.map{|link| /ix=(\d+)/ =~ link; $1 }.compact

      sequences = sequences | new_sequences

      if page >= last then p 'last page: ' + page.to_s; break end
      page += 1
    end
    sequences
  end
  
  def detail(sequence)
    if sequence.blank? then return false end
    
    request_url = DETAIL_URL % sequence
    begin
      response = timeout(10) { open(request_url) }
    rescue TimeoutError
      p 'request time out: ' + request_url
      raise 'request time out: ' + request_url
    end

    begin
      detail = Hpricot(response.read)
      title = (detail/'td.detail-title-txt').first.inner_html
      author = (detail/'#contributor-name').first.inner_html
      published_at = DateTime.parse((detail/'#contributor-date').first.inner_html + ' JST')
      image_url = (detail/'#news_img').first[:src]
      comment = strip_tags((detail/'#detail-main > p').first.inner_html)
    rescue
      p 'detail parse error: ' + request_url
      raise 'detail parse error: ' + request_url      
    end
    
    { :title => title, :author => author, :published_at => published_at, 
      :comment => comment, :url => request_url, :image_url => image_url, 
      :sequence => sequence }
  end
end