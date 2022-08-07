class Application < ApplicationRecord
    acts_as_token_authenticatable
    validates :name, presence: true
    validates :name, presence: true


    # devise :invitable, :database_authenticatable,
    #      :recoverable, :rememberable, :trackable, :validatable,
    #      :lockable    
    
   
end

