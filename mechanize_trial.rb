require 'mechanize'
require 'open-uri'

heroes_doc = Nokogiri::HTML(open("http://dotabuff.com/heroes")) # this grabs the page.
names_array = heroes_doc.xpath("//div[@class='name']/text()")

names_array.each() do |hero|
  puts hero
end
