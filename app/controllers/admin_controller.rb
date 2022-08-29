class AdminController < ApplicationController

   def edit

      @user = User.find(params[:id])
   end  



   def update
    # binding.pry
    @user = User.find(params[:id])
    @admin = @user.features.build

    redirect_to edit_user_registration
  

  end


 end    