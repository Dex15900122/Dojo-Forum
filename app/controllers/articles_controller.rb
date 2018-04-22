class ArticlesController < ApplicationController


  def index
    @articles = Article.page(params[:page]).per(10)
  end

end
