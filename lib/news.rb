#!/usr/bin/ruby
#encoding: utf-8
require "mechanize"
require "time"
require "./thre"
#hogehoge
#hugahuga
agent = Mechanize.new
page = agent.get("http://uni.2ch.net/news/subback.html")
array = page.links.map{|link| link.href}
array2 = array.map{|link| link.split("/")[0]}
url = array2.map{|link| "http://uni.2ch.net/test/read.cgi/news/"+link}

p url.size
list = []
20.times{|i|
  #page2 = agent.get(url[i])
  
  t = Thre.new(url[i])
  p t.title
  p t.impetus


=begin
(name.size-1).times{|i|
  print no[j] + " "
  print hn[j] + " "
  print date[j] + " " + time[j] + " "
  print id[j]
  print "\n"
  print res[j]
  print "\n\n"
}
=end

}

#勢い順にソート
list.sort!
list.reverse!
(list.size-1).times{|i|
  print list[i][0].to_s + " " + list[i][1]
  print "\n"
}

