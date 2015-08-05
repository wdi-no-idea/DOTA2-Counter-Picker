class UploadController < ApplicationController

  def uploadDota()
    HeroCountersModel.destroy_all()


    heroes_doc = Nokogiri::HTML(open("http://dotabuff.com/heroes")) # this grabs the page.
    names_array = heroes_doc.xpath("//div[@class='name']/text()")
    puts names_array

    names_array.each() do |hero|
      loop_counter = 1
      puts loop_counter
      @hcountermodel = HeroCountersModel.new
      @hcountermodel.name = hero

      hero_img_doc = Nokogiri::HTML(open("http://www.dotabuff.com/heroes/#{hero}"))
      img = hero_img_doc.xpath("//img[@class='image-avatar image-hero']/@src").to_s
      puts img
      img.slice!(0)
      puts img
      image_base = "http://dotabuff.com/"
      uri_name = image_base + img
      puts uri_name
      img = 'public/images/' + img
      puts img

      @hcountermodel.imageurl = img
      puts uri_name
      File.open(img, 'wb') do |fo|
        fo.write(open(uri_name).read)
      end
      puts 'we got this far'
      @hcountermodel.save
      loop_counter = loop_counter + 1
      end











    end #End of function






# This is the route for the upload. It works. Change the function above if you need to make database changes.
  get '/' do

    self.uploadDota
    erb :uploaded

  end


end
