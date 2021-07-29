class ArticlesController < ApplicationController
  layout "application"
  def index
    @articles = Article.all
  end

  def show
     @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params).save
    flash[:success] = "Article was successfully created"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to article_path(@article)
      flash[:success] = "Article was successfully updated"
    end
   
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:alert] = "Article was successfully destroyed"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
