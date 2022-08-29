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
   user = User.new
   if user.save
      flash[:success] = "New User created." 

   else 
      render 'new'  
    end
     
  end


  def edit
      # binding.pry
     @user = User.find(params[:id])

  end
    

  def update
    binding.pry
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
