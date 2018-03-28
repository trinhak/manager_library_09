class UsersController < ApplicationController
  before_action :load_user, except: %i(index new create)
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, except: %i(new create show index)

  def index
    @users = User.sort_by_name.search_by_name params[:search]
    @categories = Category.search_by_name params[:search]
    @authors = Author.order_name.search_by_name params[:search]
    @books = Book.search_by_name params[:search]
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".edit.success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    @user || render(file: "public/404.html", status: 404, layout: true)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t ".new.log_in"
      redirect_to login_url
    end
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end
end
