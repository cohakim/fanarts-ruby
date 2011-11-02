# API FOR FANTASY EARTH ZERO FANART

require 'open-uri'
require "resolv-replace"
require 'timeout'
include ActionView::Helpers::TextHelper

class API::Mabinogi
  INDEX_URL  = 'http://www.fezero.jp/com_imglist.aspx?page=%s'
  DETAIL_URL = 'http://www.fezero.jp/com_imgview.aspx?seq=%s'
  
  #
  # ファンアート掲示板から新着ファンアートのシーケンス番号を取得する
  #
  def sequences(start = 1, last = 1)
    sequences = Array.new
    page = start
    while (true) do
      if page == start || page % 10 == 0 then p 'processing: ' + page.to_s end

      request_url = INDEX_URL % page
      begin
        response = timeout(10){ open(request_url, 'r:binary') }
      rescue TimeoutError
        p 'request time out: ' + request_url
        raise 'request time out: ' + request_url
      end
      
      doc = Hpricot(response.read.encode("utf-8", "sjis", invalid: :replace, undef: :replace))
      links = (doc/:a).map{|a| a[:href] }.uniq
      new_sequences = links.map{|link| /seq=(\d+)/ =~ link; $1 }.compact

      if new_sequences.empty?
        p 'end page touched'
        p 'last page: ' + (page - 1).to_s
        break
      end

      sequences = sequences | new_sequences
      
      if page >= last then p 'last page: ' + page.to_s; break end
      page += 1
    end
    sequences
  end
  
  #
  # 指定されたシーケンス番号のファンアートの詳細情報を取得する
  #
  def detail(sequence)
    if sequence.blank? then return false end
    
    request_url = DETAIL_URL % sequence
    begin
      response = timeout(10) { open(request_url, 'r:binary') }
    rescue TimeoutError
      p 'request time out: ' + request_url
      raise 'request time out: ' + request_url
    end

    begin
      detail = Hpricot(response.read.encode("utf-8", "sjis", invalid: :replace, undef: :replace))
      title = strip_tags((detail/:td).third.inner_html.gsub(/\&nbsp;/, ' ')).strip
      author = (detail/:td).fourth.inner_html.strip
      published_at = DateTime.parse((detail/:td).fifth.inner_html.strip + ' 00:00:00 JST')
      image_url = 'http://www.fezero.jp/upload/upimage/' + sequence.to_s + 'n.jpg'
      comment = strip_tags((detail/:td)[25].try(:inner_html).try(:strip))
    rescue
      p 'detail parse error: ' + request_url
      raise 'detail parse error: ' + request_url     
    end
    
    { :title => title, :author => author, :published_at => published_at, 
      :image_url => image_url, :comment => comment, :sequence => sequence }
  end

end