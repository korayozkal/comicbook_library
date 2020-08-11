
class ComicBooksController < ApplicationController

    get "/comic_books" do 
        if logged_in?git
            @comic_books = ComicBook.all
            erb :"/comic_books/index"
        else 
            redirect '/login'
        end 
    end 
 
    get "/comic_books/new" do
        if logged_in?
           erb :"/comic_books/new"
        else 
           redirect '/login'
        end
    end 
   
    post '/comic_book' do 
    
        if logged_in?
            #comic_book = ComicBook.new(params[:comic_book])
            #comic_book.user = current_user
            comic_book = current_user.comic_books.build(params[:comic_book])
            comic_book.save 
            redirect "/comic_book/#{comic_book.id}" 
        else 
            redirect '/login'
        end 
    end 
        
    get "/comic_book/:id" do
        if logged_in?
             @comic_book = ComicBook.find_by(id: params[:id])
             erb :"/comic_books/show"
        else 
            redirect '/login'
        end 
    end

    get "/comic_books/:id/edit" do
        @comic_book = ComicBook.find_by(id: params[:id])

        if logged_in? && current_user == @comic_book.user
           erb :"/comic_books/edit"
        else 
           redirect "/comic_books"
    end
end 

put "/comic_books/:id" do
       comic_book = ComicBook.find_by(id: params[:id]) 
    if logged_in? && current_user == @comic_book.user
       comic_book.update(params[:comic_book])
       redirect "/comic_book/#{comic_book.id}"
    else 
       redirect '/login'
   end
end

delete "/comic_books/:id" do
        comic_book = ComicBook.find_by(id: params[:id])
     if logged_in? && current_user == comic_book.user 
        comic_book.destroy
        redirect "/comic_books"
  else 
         redirect '/login'
    end 
end

end

