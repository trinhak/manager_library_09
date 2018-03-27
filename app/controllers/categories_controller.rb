class CategoriesController < ApplicationController
  before_action :load_category, except: %i(new create index)
  before_action :check_admin, except: %i(new create index)

  def show
    @books = @category.book.sort_by_alphabet.paginate page: params[:page]
  end

  def index
    @categories = Category.all
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

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".edit.success"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "pub.delete_succ"
    else
      flash[:danger] = t "pub.error"
    end
    redirect_to categories_url
  end

  private

  def category_params
    params.require(:category).permit :name, :parent_id
  end

  def load_category
    @category = Category.find_by id: params[:id]
    @category || render(file: "public/404.html", status: 404, layout: true)
  end

  def check_admin
    redirect_to root_url unless current_user.admin?
  end
end
