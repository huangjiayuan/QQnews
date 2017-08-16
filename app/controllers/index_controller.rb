class IndexController < ApplicationController

  def index
    $redis.lpush('test',getContent("http://news.qq.com/a/20170815/035706.htm"))
  end

  def getContent(url)
    Thread.new do
      sleep(10)
      doc   = Nokogiri::HTML(open(url))
      title = doc.css('h1').text
      contentString = ""
      doc.css('div#Cnt-Main-Article-QQ p').each do |content|
        contentString += content.text
      end
      QqNew.find_or_create_by(:url => url, :title => title, :content => contentString)
    end
  end
end
