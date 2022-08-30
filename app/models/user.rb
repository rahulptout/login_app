class User < ApplicationRecord
  attr_accessor :current_password
  has_one :user_info
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  belongs_to :role
  before_validation  :default_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   ROLE = Role.all.pluck(:name, :id)

   # default user option
   # binding.pry

   def default_user
     self.role_id = Role.find_by(name: "user").id
   end

  def update_without_password(params, *options)
  if params[:password].blank?
    params.delete(:password)
    params.delete(:password_confirmation) 
  end

  result = update_attributes(params, *options)
  clean_up_passwords
  result
end


  
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
