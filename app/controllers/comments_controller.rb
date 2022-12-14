# frozen_string_literal: true

# Used for commenting in Articles and Events
class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    @comment.save
    redirect_to @commentable, notice: 'Your comment was successfully created.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
