class UploadController < ApplicationController

  def uploadDota()
    heroes_doc = Nokogiri::HTML(open("http://dotabuff.com/heroes")) # this grabs the page.
    names_array = heroes_doc.xpath("//div[@class='name']/text()")

    # puts names_array

    names_array.each() do |hero|
      @hcountermodel = HeroCountersModel.new
      @hcountermodel.name = hero
      @hcountermodel.save

    end

  end


  get '/' do

    self.uploadDota
    erb :uploaded

  end


end
