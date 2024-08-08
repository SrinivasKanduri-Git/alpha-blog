require "test_helper"

class UserActionsMailerTest < ActionMailer::TestCase
  test "unauthorized_action" do
    mail = UserActionsMailer.unauthorized_action
    assert_equal "Unauthorized action", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
