class UploadController < ApplicationController

  def uploadDota()

    #
    #
    # heroes_doc = Nokogiri::HTML(open("http://dotabuff.com/heroes")) # this grabs the page.
    # names_array = heroes_doc.xpath("//div[@class='name']/text()")
    #
    # names_array.each() do |hero|
    #   @hcountermodel = HeroCountersModel.new
    #   @hcountermodel.name = hero
    #
    #   # the whole function goes in here!
    #
    #   @hcountermodel.save
    # end


 # test database
    HeroCountersModel.destroy_all()
    @hcountermodel = HeroCountersModel.new
    @hcountermodel.name = "abaddon"



    hero = "abaddon"

    hero_img_doc = Nokogiri::HTML(open("http://www.dotabuff.com/heroes/#{hero}"))
    img = hero_img_doc.xpath("//img[@class='image-avatar image-hero']/@src")
    image_base = "http://dotabuff.com"
    uri_name = image_base + img.to_s



    open(uri_name) { |f|
      File.open("public/images#{img}", "wb") do |file|
        file.puts f.write()
      end
    }



    @hcountermodel.imageurl = img
    @hcountermodel.save




  end #End of function






# This is the route for the upload. It works. Change the function above if you need to make database changes.
  get '/' do

    self.uploadDota
    erb :uploaded

  end


end
