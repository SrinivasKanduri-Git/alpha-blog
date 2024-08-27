# frozen_string_literal: true

class ArticleMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.new_article.subject
  #
  def new_article(object)
    @object = object

    mail to: @object.user.email, subject: 'A new article was created.'
  end
end
