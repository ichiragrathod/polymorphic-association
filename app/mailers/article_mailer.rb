# frozen_string_literal: true

class ArticleMailer < ApplicationMailer
  def article_created
    @user = params[:user]
    @article = params[:article]

    mail to: @user.email, subject: 'Article Created.'
  end
end
