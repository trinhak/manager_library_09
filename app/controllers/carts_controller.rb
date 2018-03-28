class CartsController < ApplicationController
  before_action :set_cart, except: %i(new index)

  def index
    @carts = []
    if session[:cart_id]
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end

  def show; end

  def new
    @cart = Cart.new
  end

  def edit; end

  def destroy
    @cart = current_cart
    respond_to do |format|
      if @cart.destroy
        session[:cart_id] = nil
        format.html{redirect_to carts_url, notice: t(".destroy_notice")}
        format.json{head :no_content}
      else
        format.html{render :index}
        format.json{render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def set_cart
    @cart = Cart.find_by id: params[:id]
    @cart || render(file: "public/404.html", status: 404, layout: true)
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
