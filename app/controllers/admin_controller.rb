class AdminController < ApplicationController

   def edit

   @user = User.find(params[:id])

   end  


 end    