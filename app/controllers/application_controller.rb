class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

      # before_action :global_user
     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:city_id, :email, :password, :password_confirmation)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:city_id, :role_id, :name, :mobile_no, :address)}
          end

    
       

  # def global_user

  #   book.user_id = current_user.id 
  # end


end


 

    