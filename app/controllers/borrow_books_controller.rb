class BorrowBooksController < ApplicationController
  before_action :set_borrow_book, except: %i(new create)

  def index
    @borrow_books = BorrowBook.sort_by_alphabet.paginate page: params[:page]
    @user = current_user
  end

  def show; end

  def new
    @cart = current_cart
      if @cart.line_items.empty?
        redirect_to root_path
        flash[:danger] = t ".notice"
        return
      end
    @borrow_book = BorrowBook.new
  end

  def edit; end

  def create
    @borrow_book = BorrowBook.new borrow_book_params
    respond_to do |format|
      if @borrow_book.save
        session[:cart_id] = nil
        format.html{redirect_to @borrow_book, notice: t(".create_notice")}
        format.json{render :show, status: :created, location: @borrow_book}
      else
        format.html{render :new}
        format.json{render json: @borrow_book.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @borrow_book.update(borrow_book_params)
        format.html{redirect_to @borrow_book, notice: t(".update_notice")}
        format.json{render :show, status: :ok, location: @borrow_book}
      else
        format.html{render :edit}
        format.json{render json: @borrow_book.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @borrow_book.destroy
    respond_to do |format|
      format.html{redirect_to borrow_books_url, notice: t(".destroy_notice")}
      format.json{head :no_content}
    end
  end

  private

  def set_borrow_book
    @borrow_book = BorrowBook.find_by id: params[:id]
  end

  def borrow_book_params
    params.require(:borrow_book).permit :user_id, :borrow_start, :borrow_end, :quantity, :status
  end
end
