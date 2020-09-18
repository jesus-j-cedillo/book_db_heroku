class BooksController < ApplicationController
  
  def index
    @books = Book.order("created_at DESC")
  end

  def show
    #params[:id] gets the current id
    #find send a query to get the current id
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    #instantiate a new object using form paramaters
    @book = Book.new(book_params)

    #save the object
    if @book.save
      #if save succeeds, redirect to the index action
      flash[:notice] = "#{@book.book_title} was created successfully"
      redirect_to(books_path)
    else
      #if save fails, redisplay the form but the fields will already be pre-filled
      render('new') 
    end
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    #Find an existing object using form paramaters
    @book = Book.find(params[:id])
    
    #Update the object
    if @book.update_attributes(book_params)
      #if save succeeds, redirect to the Show action
      flash[:notice] = " #{@book.book_title} was updated successfully"
      redirect_to(books_path)
    else
      #if save fails, redisplay the form but the fields will already be pre-filled
      render('edit') 
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "#{@book.book_title} was deleted successfully"
    redirect_to(books_path)
  end

  private

  def book_params
    params.require(:book).permit(:book_title, :published_date, :author, :genre ) 
  end

end
