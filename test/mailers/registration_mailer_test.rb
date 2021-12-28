require "test_helper"

class RegistrationMailerTest < ActionMailer::TestCase
  setup do
    @user = create(:user)
  end

  test "invite" do
    email = RegistrationMailer.with(user: @user).invite

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ["from@example.com"], email.from
    assert_equal [@user.email], email.to
  end
end
