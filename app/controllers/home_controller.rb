class HomeController < ApplicationController
  def index
    @users = User.all 
      
   
  end

  def show
    @user = User.find(params[:id])
  end  

  def new 
    @user = User.new

  end
  

  def create
     
  end


  def edit
    
    
     @user = User.find(params[:id])

  end
    

  def update
    @user = User.find(params[:id])

    redirect_to edit_user_registration
  

  end


  def destroy

   @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other

  end  




end
