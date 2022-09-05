class HomeController < ApplicationController
   before_action :authenticate_user!
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
   user = User.new
   if user.save
      flash[:success] = "New User created." 

   else 
      render 'new'  
    end
     
  end


  def edit
     
     @user = User.find(params[:id])

  end
    

  def update
   
    @user = User.find(params[:id])
    if @user.update()
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity

    end
  end


  def destroy

   @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other

  end  




end
