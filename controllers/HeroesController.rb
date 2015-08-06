class HeroesController < ApplicationController

  #Added
    #----------------------------------------------------------
    #Used to check if the user has a current session(logged in)
    #If session exists to to resource
    #May have to add for each route, but we will try to add at the top of each controller



    #----------------------------------------------------------

  get '/' do

    if is_not_authenticated? == false
      @heroes = HeroCountersModel.all
      erb :'heroes_views/heroes_index'
    else
      redirect 'login/'
    end

  end

  post '/' do
    if is_not_authenticated? == false
      @heroes = HeroCountersModel.all
      puts " HC post return to heroes_index as a post"
      return erb :'heroes_views/good'

    else
      puts "HC login error"
      return erb :'login_views/login_index'
    end
  end

end
