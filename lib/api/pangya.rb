# API FOR PANGYA FANART

require 'open-uri'
require "resolv-replace"
require 'timeout'
include ActionView::Helpers::TextHelper

class API::Pangya
  INDEX_URL  = 'http://www.pangya.jp/fan_ibbs_list.aspx?page=%s'
  DETAIL_URL = 'http://www.pangya.jp/fan_ibbs_view.aspx?seq=%s'
  
  def sequences(start = 1, last = 1)
    sequences = Array.new
    page = start
    while (true) do
      if page == start || page % 100 == 0 then p 'processing: ' + page.to_s end
      
      request_url = INDEX_URL % page
      begin
        response = timeout(10){ open(request_url, 'r:binary') }
      rescue TimeoutError
        p 'request time out: ' + request_url
        raise 'request time out: ' + request_url
      end
      
      doc = Hpricot(response.read)
      links = (doc/'#illust_list'/:a).map{|a| a[:href] }.uniq
      new_sequences = links.map{|link| /seq=(\d+)/ =~ link; $1 }.compact
      
      if new_sequences.empty?
        p 'end page touched: ' + (page - 1).to_s
        break
      end
      
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
      response = timeout(10) { open(request_url, 'r:binary') }
    rescue TimeoutError
      p 'request time out: ' + request_url
      raise 'request time out: ' + request_url
    end
    
    begin
      detail = Hpricot(response.read.encode("utf-8", "utf-8", :invalid => :replace, :undef => :replace)) # エンコードするとエラー・・・
      title = strip_tags((detail/'td.post_head_ttl').first.inner_html).strip
      author = strip_tags((detail/'p.post_info_left').first.inner_html.gsub(/&nbsp;/,'')).strip
      published_at = lambda {
        /&nbsp;(.+)&nbsp;&nbsp;.+/ =~ strip_tags((detail/'p.post_info_right').first.inner_html)
        DateTime.parse('20' + $1 + 'JST')
      }.call
      image_url = 'http://www.pangya.jp/upload/ibbs/' + sequence.to_s + 'n.jpg'
      comment = strip_tags((detail/'p.post_body').first.inner_html)
    rescue => ex
      p ex.message
      p 'detail parse error: ' + request_url
      raise 'detail parse error: ' + request_url      
    end
    
    { :title => title, :author => author, :published_at => published_at, 
      :comment => comment, :url => request_url, :image_url => image_url, 
      :sequence => sequence }
  end
  
end