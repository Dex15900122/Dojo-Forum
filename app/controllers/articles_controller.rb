class ArticlesController < ApplicationController
 before_action :authenticate_user! , except: [:index]
 before_action :site_article , except: [:index]

  def index
    @articles = Article.page(params[:page]).per(10)
  end


  def show
    @article = Article.find(params[:id])
  end




  private


  def site_article
    @article = Article.find(params[:id])
  end




end
