Specifications for the Sinatra Assessment
Specs:

 X- Use Sinatra to build the app 
 I used 'Sinatra'gem to build the app

 X- Use ActiveRecord for storing information in a database
 I used ActiveRecord for storing the information. Please check the schema.rb file in my db folder.

 X-Include more than one model class (e.g. User, Post, Category)
 I built a User model class and a ComicBook model class
 
 X-Include at least one has_many relationship on your User model (e.g. User has_many Posts)

 In my model, User has_many ComicBooks =>  has_many :comic_books

 X-Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

 In my model, ComicBook belongs_to User => belongs_to :user 
 
 X-Include user accounts with unique login attribute (username or email)
 My app requires user accounts to have a unique login attribute of a username
 User Model => validates :username, presence: true, uniqueness: true

 X-Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

# READ 
The Read CRUD action corresponds to two different controller actions in the comic_books controller
show and index.

- The SHOW action  renders the ERB view show.erb, which shows an individual comic book.  
   get "/comic_book/:id"    => erb :"/comic_books/show"

- The INDEX action  renders the ERB view index.erb, which shows a list of all of the comic books.
   get "/comic_books"       => erb :"/comic_books/index"
# CREATE 
The NEW action creates a route in the controller,  get "/comic_books/new" 
that renders the new.erb view  erb :"/comic_books/new"
erb :"/comic_books/new" is a blank form that submits a POST request to => post  '/comic_book' 

when the form sends the request to  CREATE action controller post '/comic_book', that creates a new comic book from the params from the form, then redirects to that new comic book’s show page => redirect "/comic_book/#{comic_book.id}"

# UPDATE
The Update CRUD action corresponds to the edit controller action and update controller action.

the edit controller action  get "/comic_books/:id/edit"  that renders the view  erb :"/comic_books/edit"
This view contains a form to update a specific comic book  with pre-populated fields including the existing title and information of the comic book. 

We send a hidden put request in the form 
<form action=<%= "/comic_books/#{@comic_book.id}" %> method="post">
<input type="hidden" name="_method" value="put">

the post request will be overridden by Rack::MethodOverride middleware, which lets us to complete the put action(also delete in the next CRUD action) in our controller and update the comic book from the params from the form.

# DELETE
The Delete CRUD action corresponds to the delete controller action, delete "/comic_books/:id"

To initiate this action,  a "delete" button was added to the show page.
<form action=<%= "/comic_books/#{@comic_book.id}" %> method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value=<%= "Delete #{@comic_book.title}" %>>
</form>

This button sends a request to the delete controller action, where we will identify the article to delete and then delete it. Then, the action direct redirect to the index of all comic books   => redirect "/comic_books"

 X-Ensure that users can't modify content created by other users
 I used current_user helper method in my comic_books controller actions to ensure only if the user using the app in the current session is equal to the user who has created the comic_book, can delete and update content created in the app by using the conditional below: 

if the current_user == @comic_book.user 

Also in the edit and show views I used the same conditional to display the edit and display form options. 

 X-Include user input validations
 I used validations in my models to make sure to keep the data clean.

 X-BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

I used error messages in my controller actions and view forms to inform the validation criteria must be met to complete the action. 

For example: 
If username or password is an empty string  
    if params[:username] == ""  || params[:password] == ""		
the user will see the error message    
	@error = "Username and password must be filled out." 
set in the view by the line of code below 
    <h3 style="color:red;"><%=@error%></h3>

 X-Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
 
 My README.md file includes the information requested about. Please check the README.md file for details.

Confirm
 X-You have a large number of small Git commits
 X-Your commit messages are meaningful
 X-You made the changes in a commit that relate to the commit message
 X-You don't include changes in a commit that aren't related to the commit message