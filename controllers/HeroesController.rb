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
      #--------------------------------
      #actual controller
      @hero_1 = params[:hero_1]
      @hero_2 = params[:hero_2]
      @hero_3 = params[:hero_3]
      @hero_4 = params[:hero_4]
      @hero_5 = params[:hero_5]
      @heroes_list = [@hero_1, @hero_2, @hero_3, @hero_4, @hero_5]




      #--------------------------------
      return erb :'heroes_views/heroes_results'
    else
      redirect 'login/'
    end
  end






end # class end
