class LoginController < ApplicationController

  def does_user_exist?(username)

    user = UsersModel.findby(:user_name => username.to_s)
    if user
      return true
    else
      return false
    end

  end

  get '/' do
    erb :login_index
  end

  post '/' do

    user_name = params[:user_name]
    if self.does_user_exist?(user_name) == true
      user = UsersModel.where(:user_name => user_name).first!

      if user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
        erb :login_success
      end
    end

    erb :login_fail

  end





end
