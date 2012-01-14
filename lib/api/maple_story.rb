# API FOR MAPLESTORY FANART

require 'open-uri'
require "resolv-replace"
require 'timeout'
include ActionView::Helpers::TextHelper

class API::MapleStory
  INDEX_URL  = 'http://maplestory.nexon.co.jp/community/fanart/?p=%s'
  DETAIL_URL = 'http://maplestory.nexon.co.jp/community/fanart/view.asp?sn=%s'

  def sequences(start = 1, last = 1)
    sequences = Array.new
    page = start
    last = [last, 500].min # slow page load times caused by old page
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
      links = (doc/'div.newarrival-art-data'/'h4'/:a).map{|a| a[:href] }.uniq
      new_sequences = links.map{|link| /sn=(\d+)/ =~ link; $1 }.compact

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
      title = strip_tags((detail/'#bbs-ttl'/:table/:td).first.inner_html).strip
      author = strip_tags((detail/'#bbs-writer'/:dd).first.inner_html).strip
      published_at = DateTime.parse((detail/'#bbs-write-date').first.inner_html + ':00 JST')
      image_url = (detail/'#illust'/:img).first[:src]
      comment = strip_tags((detail/'#bbs-text').first.inner_html).strip
    rescue
      p 'detail parse error: ' + request_url
      raise 'detail parse error: ' + request_url
    end

    { :title => title, :author => author, :published_at => published_at,
      :comment => comment, :url => request_url, :image_url => image_url,
      :sequence => sequence }
  end

end