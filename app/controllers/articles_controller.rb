class ArticlesController < ApplicationController
 before_action :authenticate_user! , except: [:index]
 before_action :site_article , except: [:index, :new, :create]
 impressionist :actions => [:show, :index]

  def index
    @articles = Article.order(replies_count: :desc).page(params[:page]).per(8)
    @categories = Category.all
  end


  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.page(params[:page]).per(20)
    @user = User.find_by(id: @article.user_id)
    @comment = Comment.new
    impressionist(@article, "message...") # 2nd argument is optional
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
    @article.destroy
    redirect_to root_path
  end

  def favorite
    @article.favorites.create!(user: current_user)
  end

  def unfavorite
   
    @favorites = Favorite.where(article_id: @article.id, user: current_user)
    @favorites.destroy_all
  end


  private


  def site_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title,:image, :status, :content, category_ids: [])

  end




end
