class ArticlesController < ApplicationController
  # before_action :string_gen, only: [ :show, :edit, :update, :destroy]
  before_action :string_gen, except: [ :index, :new, :create]
  #get
  def index
    @articles = Article.all
  end
  #Get
  def show;  end
  #Get
  def new
    @article = Article.new
  end
  #post
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  #Get
  def edit;  end
  #Patch
  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

   def destroy

    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  
    def article_params
      params.require(:article).permit(:title, :body)
    end
    def string_gen
      @article = Article.find(params[:id])
    end
end
