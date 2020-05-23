class BooksController < ApplicationController
  def index
  	@bookers = Book.all
    @newbooker = Book.new     
  end

  def create
    @bookers = Book.all
    @newbooker = Book.new(booker_params)
    if @newbooker.save
        flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(@newbooker)
    else
        render "books/index"
    end
  end

  def show
  	@booker = Book.find(params[:id])
  end

  def new  	
  end

  def edit
  	@booker = Book.find(params[:id])
  end

  def update
  	@booker = Book.find(params[:id])
  	if @booker.update(booker_params)
      flash[:notice] = 'Book was successfully updated.'
  	  redirect_to book_path(@booker)
    else
      render "books/edit"      
    end
  end

  def destroy
    booker = Book.find(params[:id])
    booker.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private
  def booker_params
  	params.require(:book).permit(:title, :body)
  end
end

 
