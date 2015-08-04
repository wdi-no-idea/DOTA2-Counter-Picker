require 'mechanize'
require 'open-uri'

heroes_doc = Nokogiri::HTML(open("http://dotabuff.com/heroes")) # this grabs the page.
names_array = doc.xpath("//div[@class='name']/text()")

puts names_array



names_array.each() {
  herocountermodel = HeroCounterModel.new
  | hero | herocountermodel.name = hero.to_s
}
