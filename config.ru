require 'sinatra/base'
require 'mechanize'
Dir.glob('./{controllers,models}/*.rb').each {
  |file| require file
}


map ('/') {run HomeController}
map ('/login') {run LoginController}
map ('/register') {run RegisterController}
map ('/heroes') {run HeroesController}
