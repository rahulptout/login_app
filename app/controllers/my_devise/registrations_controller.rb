class MyDevise::RegistrationsController < Devise::RegistrationsController
  before_action :user_params ,only: [:update]
 
 def update
  if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
    params[:user].delete(:password)
    params[:user].delete(:password_confirmation)
end
  @user = User.find(current_user.id)
  email_changed = @user.email != params[:user][:email]
  password_changed = params[:user][:password] && !params[:user][:password].empty?
  successfully_updated = if email_changed or password_changed
    @user.update_with_password(user_params)
  else
    @user.update_without_password(params[:user])
  end

  if successfully_updated
    # Sign in the user bypassing validation in case his password changed
    sign_in @user, :bypass => true
    # redirect_to after_update_path_for(user)
    render "home/show"
    
  else
    render "edit"
  end
 end



def user_params
    params.require(:user).permit(:email, :password, :current_password,:password_confirmation,:role_id, :name, :mobile_no, :address)
  end


protected


def update_resource(resource, params)
    puts "params ===> #{params}"
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
      params.delete(:current_password)
      resource.update_without_password(params)
    else
      super
    end
  end

end	