
class ApplicationController < Sinatra::Base

  require 'bundler'
  Bundler.require()

  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'herocounterpicker'
  )

  #Added
  #enable server-side sessions for users
  enable :sessions
  #Moved from LoginController
  def does_user_exist?(username)

    user = UsersModel.find_by(:user_name => username.to_s)
    if user
      return true
    else
      return false
    end


  end

  #This checks if the user is currently authenticated
  def is_not_authenticated?
    #if yes, it is not, nil else false
    session[:user].nil?
  end
#-------------------------------------------------------
  set :views, File.expand_path('../../views',__FILE__)
  set :public_folder, File.expand_path('../../public',__FILE__)


  not_found do
    erb :not_found
  end

end
