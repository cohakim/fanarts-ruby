# API FOR PAPERMAN FANART

require 'open-uri'
require "resolv-replace"
require 'timeout'
include ActionView::Helpers::TextHelper

class API::Paperman
  INDEX_URL  = 'http://www.paperman.jp/com_imglist.aspx?page=%s'
  DETAIL_URL = 'http://www.paperman.jp/com_imgview.aspx?seq=%s'

  def sequences(start = 1, last = 1)
    sequences = Array.new
    page = start
    page = page - 1 # PAPERMAN page start 0
    while (true) do
      if page == start || page % 100 == 0 then p 'processing: ' + page.to_s end

      request_url = INDEX_URL % page
      begin
        response = timeout(10){ open(request_url, 'r:binary') }
      rescue TimeoutError
        p 'request time out: ' + request_url
        raise 'request time out: ' + request_url
      end

      doc = Hpricot(response.read.encode("utf-8", "sjis", invalid: :replace, undef: :replace))
      links = (doc/:a).map{|a| a[:href] }.uniq
      new_sequences = links.map{|link| /com_imgview.aspx\?page=\d+&seq=(\d+)/ =~ link; $1 }.compact

      if new_sequences.empty?
        p 'end page touched: ' + (page - 1).to_s
        break
      end

      sequences = (sequences | new_sequences).compact

      if page >= last then p 'last page: ' + page.to_s; break end
      page += 1
    end
    sequences
  end

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
      title = strip_tags((detail/:td).fourth.inner_html.gsub(/\&nbsp;/, ' ')).strip
      author = strip_tags((detail/:td).fifth.inner_html).try(:strip)
      published_at = DateTime.parse((detail/:td)[6].inner_html.strip + ' 00:00:00 JST')
      image_url = 'http://www.paperman.jp/upload/upimage/' + sequence.to_s + 'n.jpg'
      comment = strip_tags((detail/:td)[12].try(:inner_html).try(:strip))
    rescue
      p 'detail parse error: ' + request_url
      raise 'detail parse error: ' + request_url
    end

    { :title => title, :author => author, :published_at => published_at,
      :comment => comment, :url => request_url, :image_url => image_url,
      :sequence => sequence }
  end

end