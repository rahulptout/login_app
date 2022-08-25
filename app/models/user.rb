class User < ApplicationRecord
  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   # instance method
   def admin?
    role&.name == "admin"
   end 

    # class method
   def self.admin?(obj)
    obj.role&.name == "admin"
   end

   def manager?
   role&.name == "manager"
   end 

   def super_admin?
   role&.name == "super_admin"
   end


end
