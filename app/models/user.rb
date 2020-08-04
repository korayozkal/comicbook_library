class User < ActiveRecord::Base
    has_many :comic_books
    has_secure_password 

    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    #https://api.rubyonrails.org/classes/ActiveModel/Validations/HelperMethods.html check 
end

