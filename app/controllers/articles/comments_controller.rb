# frozen_string_literal: true

module Articles
  # For Article Comments
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @commentable = Article.find(params[:article_id])
    end
  end
end
