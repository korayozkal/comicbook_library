class UsersController < ApplicationController

	get '/signup' do
	    erb :'/signup'
	end

	get '/login' do 
	if logged_in?
	   redirect to '/comic_books'	
	else
	   erb :'/login'
	   end
    end
  
    post '/signup' do
    if params[:username] == ""  || params[:password] == ""	#TEST	
	   @error = "Username and password must be filled out." #ERROR MESSAGE
	   erb :'/signup'  

   
    elsif params[:username] == User.find_by(username: params[:username])
       erb :'/signup'
    else 
	    user = User.create(username: params[:username], password: params[:password])	
        user.save 
	    session[:user_id] = user.id	
	    redirect to '/login'
	end
end

    post '/login' do
    user = User.find_by(username: params[:username])
    #binding.pry
	if params[:username] == ""  || params[:password] == ""	
	   @error = "Username and password must be filled out."#ERROR MESSAGE
	   erb :'/login'

    elsif  user && user.authenticate(params[:password])
	   session[:user_id] = user.id
	   redirect to '/comic_books'

	else
		@error = "Username and password do not match."
	    erb :'/login' 
	end
end

	get '/logout' do
	  session[:user_id] = nil #or session.clear
	  redirect to "/"
	end
  
end
