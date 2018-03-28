class LineItemsController < ApplicationController
  before_action :set_line_item, except: %i(new create)

  def index
    @line_items = LineItem.sort_by_alphabet
  end

  def show; end

  def new
    @line_item = LineItem.new
  end

  def edit; end

  def create
    @cart = current_cart
    book = Book.find_by book_id: params[:book_id]
    @line_item = @cart.line_items.build(book: book)
    respond_to do |format|
      if @line_item.save
        format.html{redirect_to @line_item, notice: t(".create_notice")}
        format.json{render :show, status: :created, location: @line_item}
      else
        format.html{render :new}
        format.json{render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html{redirect_to @line_item, notice: t(".update_notice")}
        format.json{render :show, status: :ok, location: @line_item}
      else
        format.html{render :edit}
        format.json{render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @line_item.destroy
        format.html{redirect_to line_items_url, notice: t(".destroy_notice")}
        format.json{head :no_content}
      else
        format.html{render :index}
        format.json{render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find_by id: params[:id]
    @line_item || render(file: "public/404.html", status: 404, layout: true)
  end

  def line_item_params
    params.require(:line_item).permit :book_id, :cart_id
  end
end
