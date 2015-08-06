class LoginController < ApplicationController

#This should be removed
  # def does_user_exist?(username)
  #
  #   user = UsersModel.find_by(:user_name => username.to_s)
  #   if user
  #     return true
  #   else
  #     return false
  #   end
  #
  # end

  get '/' do
    erb :'login_views/login_index'
  end

  post '/' do

    user_name = params[:user_name]
    if does_user_exist?(user_name) == true #removed this from beginning
      user = UsersModel.where(:user_name => user_name).first!

      if user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
        session[:user_name] = user
        puts "good password"
        redirect  '/heroes'
        puts "tried"
      end

    end
    puts "bad password"
    erb :'login_views/login_fail'
  end

  #Add a route for logging out and setting the session to nil
    #------------------------------------------
    get '/logout' do
      puts "I hit the logout in the LC"
      puts params[:user_name]
      session[:user_name] = nil
      redirect '/'
    end
    #-------------------------------------------




end
