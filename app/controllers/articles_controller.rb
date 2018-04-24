class ArticlesController < ApplicationController
 before_action :authenticate_user! , except: [:index]
 before_action :site_article , except: [:index, :new, :create]

  def index
    @articles = Article.page(params[:page]).per(10)
    @categories = Category.all
  end


  def show
    @article = Article.find(params[:id])
    @user = User.find_by(id: @article.user_id)
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end


  def create 
    @article = Article.new(article_params)
    @article.user_id = current_user.id
  
    if @article.save
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article.dertroy
    redirect_to root_path
  end


  private


  def site_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title,:image, :status, :content, category_ids: [])

  end




end
