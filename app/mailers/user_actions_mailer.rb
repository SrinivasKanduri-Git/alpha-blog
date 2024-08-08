class UserActionsMailer < ApplicationMailer

  include ActionView::Helpers::UrlHelper
  default_url_options[:host] = 'localhost:3000'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_actions_mailer.unauthorized_action.subject
  #
  def unauthorized_action(obj)
    @obj = obj
    mail to: @obj.email, subject: "Unauthorized action!!"
  end
end
