# frozen_string_literal: true

# Event class for creating events
class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    authorize! :read, @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post details was Added successfully.'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    authorize! :read, @post
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post updated successfully.'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
