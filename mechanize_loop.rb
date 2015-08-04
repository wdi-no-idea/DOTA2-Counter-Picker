require 'mechanize'
require 'open-uri'

doc = Nokogiri::HTML(open("http://www.dotabuff.com/heroes/abaddon")) # this grabs the page.








link: https://www.dotabuff.com/heroes/<heroname>
query: //section[5]/article/table/tbody/tr/td[2]






link: https://www.dotabuff.com/heroes/<hero_name>
query: //section[5]/article/table/tbody/tr/td[@class='cell-icon']/div[@class='image-container image-container-icon image-container-hero']/a/img[@class='image-icon image-hero']/@src



link: https://www.dotabuff.com/heroes/<hero_name>
query: //img[@class='image-avatar image-hero']/@src
