class CommentsController < ApplicationController
  before_action :set_article  
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_build, only: [:index, :new]

  def index
    @comments = @article.comments.all
  end

  def show; end

  def new;  end

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_comments_path(@article), success: "Comment successful."
    else 
      flash.now[:error] = "Error: Validation Error"
      @comments = @article.comments.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit;end

  def update
    if @comment.update(comment_params)
      redirect_to article_comments_path(@article), success: "Comment edited"
    else 
      flash.now[:error] = "Error: Validation Error"
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @comment.destroy
    redirect_to article_comments_path(@article), warning: "Comment deleted."
  end
  
  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def set_build
    @comment = @article.comments.build
  end
end
