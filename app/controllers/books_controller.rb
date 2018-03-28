class BooksController < ApplicationController
  
  def index
    @books = Book.sort_by_name.paginate page: params[:page]
    respond_to do |format|
      format.html
      format.xml
      format.json{render json: @books.to_json}
    end
  end

  def show
    @book = Book.find_by id: params[:id]
    @book || render(file: "public/404.html", status: 404, layout: true)
  end

  def new
    @book = Book.new
    @authors = Author.all
    @categories = Category.all
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".success"
      redirect_to @book
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit :name, :category_id, :publisher, :author_id, :description, :quantity, :picture
  end
end
