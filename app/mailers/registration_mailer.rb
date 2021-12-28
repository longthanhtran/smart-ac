class RegistrationMailer < ApplicationMailer
  def invite
    @token  = params[:user].signed_id(purpose: 'invite_user', expires_in: 15.minutes)
    subject = "You are invited to Smart AC"

    mail \
      subject: subject,
      to:      params[:user].email
  end
end
