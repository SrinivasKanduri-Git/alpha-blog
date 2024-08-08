# Preview all emails at http://localhost:3000/rails/mailers/user_actions_mailer
class UserActionsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_actions_mailer/unauthorized_action
  def unauthorized_action
    UserActionsMailer.unauthorized_action
  end

end
