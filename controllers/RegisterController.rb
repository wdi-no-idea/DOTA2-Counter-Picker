class RegisterController < ApplicationController

  get '/' do
    erb :register_index
  end

  post '/success' do

    @new_user = UsersModel.new

    @new_user.user_name = params[:user_name]
    @new_user.user_email = params[:user_email]
    # @new_user.is_admin = false

    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)

    @new_user.password_salt = password_salt
    @new_user.password_hash = password_hash
    erb :register_success
  end

end
