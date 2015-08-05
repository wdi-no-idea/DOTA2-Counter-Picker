class UploadController < ApplicationController
# run this class once to populate databse but no more cuz its not needed.
  def uploadDota()
    HeroCountersModel.destroy_all()


    heroes_doc = Nokogiri::HTML(open("http://dotabuff.com/heroes")) # this grabs the page.
    names_array = heroes_doc.xpath("//div[@class='name']/text()")
    puts names_array

    names_array.each() do |hero|
      @hcountermodel = HeroCountersModel.new
      @hcountermodel.name = hero
      uri_hero = hero.to_s.downcase.gsub(" ","-").gsub("'","")

      puts "----"
      puts uri_hero
      puts "----"

      hero_img_doc = Nokogiri::HTML(open("http://www.dotabuff.com/heroes/#{uri_hero}"))
      img = hero_img_doc.xpath("//img[@class='image-avatar image-hero']/@src").to_s
      img.slice!(0)
      image_base = "http://dotabuff.com/"
      uri_name = image_base + img
      img = 'public/images/' + img

      @hcountermodel.imageurl = img
      File.open(img, 'wb') do |fo|
        fo.write(open(uri_name).read)
      end

#--------------------------------------------
# Everything above this line works. that code finds all the names and images. Throws the names in the database, populates public folder with images, and throws image path into db. Don't mess...
#--------------------------------------------



    hero_counter_doc = Nokogiri::HTML(open("http://www.dotabuff.com/heroes/#{uri_hero}"))
    hero_counter_array = hero_counter_doc.xpath("//section[5]/article/table/tbody/tr/td[2]/a[@class='link-type-hero']/text()")
    count_int = 1
    hero_counter_array.each() do |item|
      count_index = 'counter' + count_int.to_s + '='
      @hcountermodel.send(count_index, item)
      count_int = count_int + 1
    end
    # Add the counter image from 1 to 8 for the hero
    hero_counter_img_doc = Nokogiri::HTML(open("http://www.dotabuff.com/heroes/#{uri_hero}"))
    hero_counter_img_array = hero_counter_img_doc.xpath("//section[5]/article/table/tbody/tr/td[@class='cell-icon']/div[@class='image-container image-container-icon image-container-hero']/a/img[@class='image-icon image-hero']/@src")
    countimg_int = 1
    hero_counter_img_array.each() do |item|
      item = "public/images" + item
      puts item
      countimg_index = "counterimageurl" + countimg_int.to_s + '='
      @hcountermodel.send(countimg_index, item)
      countimg_int = countimg_int + 1
    end






        @hcountermodel.save
      end # end of loop

    end #end of function









# This is the route for the upload. It works. Change the function above if you need to make database changes.
  get '/' do

    self.uploadDota
    erb :uploaded

  end


end
