require './config/environment'

class ApplicationController < Sinatra::Base

configure do
  enable :sessions
  set :views, 'app/views'
  set :session_secret, "password_security"
  set :public_folder, 'public'
  
  end

  get "/" do
    erb :'welcome'
  end

  helpers do

    def logged_in? #this will return a TRUE or FALSE value 
    !!current_user  #!!session[:user_id]   #-we need to turns this into boolean !this turs it to F now it is T or F !!current_user # 
    end

    def current_user
    @current_user = User.find_by(id: session[:user_id]) 
    
  end
end
end
