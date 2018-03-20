class CategoriesController < ApplicationController
  before_action :load_category, except: %i(new create index)

  def show; end

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :parent_id
  end

  def load_category
    @user = Category.find_by id: params[:id]
    @user || render(file: "public/404.html", status: 404, layout: true)
  end
end
