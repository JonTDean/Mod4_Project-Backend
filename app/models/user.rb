class User < ApplicationRecord
    has_secure_password
    
    has_many :user_players
    has_many :players, through: :user_players
    
    # For Active Record
    has_one_attached :avatar
    
    # For Password Stuff--- BCrypt/JWT
    validates :username, presence: true, uniqueness: { case_senstive: false } # Force the User to make a UName 
end