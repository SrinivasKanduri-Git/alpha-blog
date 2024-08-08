class UserActionsMailer < ApplicationMailer

  include ActionView::Helpers::UrlHelper
  default_url_options[:host] = 'localhost:3000'
  
  def new_signup_action(obj)
    @obj = obj
    mail to: @obj.email, subject: "Welcome to AlphaBlog."
  end

  def unauthorized_action(obj)
    @obj = obj
    mail to: @obj.email, subject: "Unauthorized action!!"
  end
end
