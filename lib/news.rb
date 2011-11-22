#!/usr/bin/ruby
#encoding: utf-8
require "mechanize"
require "time"
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
  page2 = agent.get(url[i])

  #スレタイ
  title = (page2/"h1").text
  #print title + ""

  #name
  name = page2/"dt"
  #print "(" + name.size.to_s + ") "

  #res
  res = page2/"dd"
  res = res.map{|link| link.text}

  name = name.map{|link| link.text}
  name = name.map{|link| link.split("：")}
  no = name.map{|link| link[0]}
  hn = name.map{|link| link[1]}
  id = name.map{|link| link[2].split(" ")}.map{|link| link[2]}
  date = name.map{|link| link[2].split(" ")}.map{|link| link[0]}.map{|link| link.sub(/\(.\)/,"")}
  time = name.map{|link| link[2].split(" ")}.map{|link| link[1]}
  day = date[0] + " " + time[0]

  #勢い
  imp = res.size/(Time.now - Time.parse(day))*60*60*24
  #p imp

  list2 = []
  list2.push(imp)
  list2.push(title)
  list.push(list2)

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

