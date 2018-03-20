class StaticPagesController < ApplicationController
  def home
    @category = Category.all
  end
end
