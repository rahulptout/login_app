class ReviewsController < ApplicationController
  def index

    @reviews = Review.all
  end

  def edit
 

  end

  def new
          @review = Review.new
          @book_id = params[:book_id]
          @book = Book.find(params[:book_id])
          session[:id] = @user.id   
  end

    def create
      @review = Review.new(review_params)
      if @book.save
        redirect_to @review
      else
        render :new,status: :unprocessable_entity
      end   
    end

  def show
  end
end
