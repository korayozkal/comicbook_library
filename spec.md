Specifications for the Sinatra Assessment
Specs:

 X- Use Sinatra to build the app 
 I used Sinatra gem to build the app

 X- Use ActiveRecord for storing information in a database
 I used ActiveRecord migrations for storing the information. Please check the schema.rb file in my db folder.

 X-Include more than one model class (e.g. User, Post, Category)
 I built a User model class and a ComicBook model class
 
 X-Include at least one has_many relationship on your User model (e.g. User has_many Posts)

 In my model, User has_many ComicBooks =>  has_many :comic_books

 X-Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

 In my model, ComicBook belongs_to User => belongs_to :user 
 
 X-Include user accounts with unique login attribute (username or email)
 My app requires user accounts to have a unique login attribute of a username
 User Model=> validates :username, presence: true, uniqueness: true

 X-Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying


 X-Ensure that users can't modify content created by other users


 X-Include user input validations


 X-BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

 X-Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
 X-You have a large number of small Git commits
 X-Your commit messages are meaningful
 X-You made the changes in a commit that relate to the commit message
 X-You don't include changes in a commit that aren't related to the commit message