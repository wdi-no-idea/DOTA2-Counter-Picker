class HeroesController < ApplicationController

get '/' do
  erb :'heroes_views/heroes_index'
end

end
