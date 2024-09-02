# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: %i[show index]
  before_action :require_same_user, only: %i[edit update destroy]

  def show; end

  def index
    @articles = Article.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      ArticleMailer.new_article(@article).deliver_now
      flash[:notice] = 'Article was successfully created.'
      redirect_to @article
    else
      render 'new', status: 422
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was edited successfully.'
      redirect_to @article
    else
      render 'edit', status: 422
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'The article was deleted.'
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :image)
  end

  def require_same_user
    return if current_user == @article.user

    flash[:alert] = 'Unauthorized action!!'
    redirect_to root_path
  end
end
