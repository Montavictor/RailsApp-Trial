class ArticlesController < ApplicationController
  # before_action :string_gen, only: [ :show, :edit, :update, :destroy]
  before_action :string_gen, except: [ :index, :new, :create]

  def index
    @articles = Article.all
  end

  def show;  end

  def new
    @article = Article.new
  end
 
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, success: "Create Article Successful."
    else
      flash[:error] = "Error: Create Article Failed."
      render :new, status: :unprocessable_entity
    end
  end
 
  def edit; end
 
  def update
    if @article.update(article_params)
      redirect_to articles_path, success: "Article Edited!"
    else
      flash[:error] = "Error: Validation Error"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other, warning: "Article deleted."
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
  
  def string_gen
    @article = Article.find(params[:id])
  end

end
