# API FOR MABINOGI RECOMMENDED SCREENSHOT

require 'open-uri'
require "resolv-replace"
require 'timeout'
include ActionView::Helpers::TextHelper

class API::MabinogiSSRec
  INDEX_URL  = 'http://www.mabinogi.jp/6th/community/ssBoardList.asp?sv=re&p=%s'
  DETAIL_URL = 'http://www.mabinogi.jp/6th/community/ssBoardContent.asp?sv=re&ix=%s'
  
  #
  # ファンアート掲示板から新着ファンアートのシーケンス番号を取得する
  #
  def self.sequences(start = 1, last = 1)
    sequences = Array.new
    page = start
    while (true) do
      if page == start || page % 10 == 0 then p 'processing: ' + page.to_s end

      request_url = INDEX_URL % page
      begin
        response = timeout(10){ open(request_url) }
      rescue TimeoutError
        p 'request time out: ' + request_url
        raise 'request time out: ' + request_url
      end

      if response.base_uri.to_s != request_url
        p 'end page touched'
        p 'last page: ' + (page - 1).to_s
        break
      end
      
      doc = Hpricot(response.read)
      links = (doc/'div.fanart-item-detail'/'div.'/:a).map{|a| a[:href] }.uniq
      new_sequences = links.map{|link| /ix=(\d+)/ =~ link; $1 }

      sequences = sequences | new_sequences
      
      if page >= last then p 'last page: ' + page.to_s; break end
      page += 1
    end
    sequences
  end
  
  #
  # 指定されたシーケンス番号のファンアートの詳細情報を取得する
  #
  def self.detail(sequence)
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
      :image_url => image_url, :comment => comment, :sequence => sequence }
  end

end
