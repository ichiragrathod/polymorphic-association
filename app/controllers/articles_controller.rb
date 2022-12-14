# frozen_string_literal: true

# Article class for creating articles
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      ArticleMailer.with(user: current_user, article: @article).article_created.deliver_now
      flash[:notice] = 'Article details was Added successfully.'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    authorize @article
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      flash[:notice] = 'Article updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to articles_path
  end

  def delete_attachment
    @file = ActiveStorage::Blob.find_signed(params[:id])
    @file.attachments.first.purge
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :image, :pdf)
  end
end
