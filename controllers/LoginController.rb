class LoginController < ApplicationController

  def does_user_exist?(username)

    user = UsersModel.find_by(:user_name => username.to_s)
    if user
      return true
    else
      return false
    end

  end

  get '/' do
    erb :'login_views/login_index'
  end

  post '/' do

    user_name = params[:user_name]
    if self.does_user_exist?(user_name) == true
      user = UsersModel.where(:user_name => user_name).first!

      if user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
        return erb :'login_views/login_success'
      end
    end
    erb :'login_views/login_fail'
  end





end
