# frozen_string_literal: true

module Events
  # For Event Comments
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @commentable = Event.find(params[:event_id])
    end
  end
end
