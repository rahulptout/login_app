class User < ApplicationRecord
  attr_accessor :current_password
  has_one :user_info
  belongs_to :city
  has_many :books
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  belongs_to :role
  before_validation  :default_user ,on: :create
  before_validation  :default_city ,on: [:create] 

     
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   # ROLE = Role.all.pluck(:name, :id)

   # default user option
   # binding.pry

   def default_user
     self.role_id = Role.find_by(name: "user").id
   end

        def update_without_password(params, *options)
        if options.present?
          ActiveSupport::Deprecation.warn <<-DEPRECATION.strip_heredoc
            [Devise] The second argument of `DatabaseAuthenticatable#update_without_password`
            (`options`) is deprecated and it will be removed in the next major version.
            It was added to support a feature deprecated in Rails 4, so you can safely remove it
            from your code.
          DEPRECATION
        end

        params.delete(:password)
        params.delete(:password_confirmation)

        result = update(params, *options)
        clean_up_passwords
        result
      end

      # Destroy record when :current_password matches, otherwise returns
      # error on :current_password. It also automatically rejects
      # :current_password if it is blank.
      def destroy_with_password(current_password)
        result = if valid_password?(current_password)
          destroy
        else
          valid?
          errors.add(:current_password, current_password.blank? ? :blank : :invalid)
          false
        end

        result
      end
  
   def default_city
      # binding.pry
     self.city_id = City.find_by(city_name: "indore").id
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
