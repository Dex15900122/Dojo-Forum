class ArticlesController < ApplicationController
 before_action :authenticate_user! , except: [:index]
 before_action :site_article , except: [:index, :new, :create]

  def index
    @articles = Article.page(params[:page]).per(10)
  end


  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end


  def create 
    @article = Article.new(article_params)

  
    if @article.save
      redirect_to root_path
    else
      render :new
    end

  end


  private


  def site_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title,:image, :status, :content, category_ids: [])

  end




end
