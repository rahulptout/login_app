class BooksController < ApplicationController

    def index
     @books = Book.all
     @id= session[:user_id]
     # binding.pry
    end
  

    def show
 
     @book = Book.find(params[:id])

    end

    def new
       @book = Book.new
       @user_id = params[:user_id]
       @user = User.find(params[:user_id])
       @id =  @user.id
      session[:user_id] = @id
    end


    def create

     @book = Book.new(book_params)
     if @book.save
    	redirect_to @book
     else
      render :new, status: :unprocessable_entity
     end

    end


    def edit
    
    @book = Book.find(params[:id])
   
    end


    def update
    
     @book = Book.find(params[:id])
     if @book.update(book_params)
     	redirect_to @book

     else 
        render :edit, status: 	:unprocessable_entity
      end
 
    end


     def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, status: :see_other
  end

   private
    
    def book_params
    params.require(:book).permit(:name, :auther_name, :issue_date, :return_date,:number_of_pages,:description,:user_id)
    # .merge(:session[:user_id])
  end
    end 


   
