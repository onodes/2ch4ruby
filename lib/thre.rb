#encoding: utf-8
require 'mechanize'

class Thre
  def initialize(url)
    @agent = Mechanize.new
    @page = @agent.get(url)
    @title = (@page/"h1").text
    @res = (@page/"dd").map{|r| r.text}
    @name = (@page/"dt").map{|n| n.text}
    @name.map!{|nn| nn.split("：")}
    @no = @name.map{|n| n[0]}
    @hn = @name.map{|n| n[1]}
    name_split = @name.map{|n| n[2].split(" ")} 
    @id = name_split.map{|n| n[2]}
    @date1 = name_split.map{|n| n[0]}.map{|n| n.sub(/\(.\)/,"")}
    @time = name_split.map{|n| n[1]}
    @date = @date1[0] + " " + @time[0]
  end

  def impetus
    return @res.size/(Time.now - Time.parse(@date)) * 60 * 60 * 24
  end

  attr_accessor :title, :date
end

=begin
t = Thre.new("http://uni.2ch.net/test/read.cgi/newsplus/1321950691/")
puts t.title
puts t.date
puts t.impetus
=end
