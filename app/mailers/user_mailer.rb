class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail(to: user.email, subject: "Account activation") do |format|
      format.text(content_transfer_encoding: "7bit")
      format.html(content_transfer_encoding: "7bit")
    end

    #mail to: user.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @greeting = "Hi"

    mail(to: user.email, subject: "Password reset") do |format|
      format.text(content_transfer_encoding: "7bit")
      format.html(content_transfer_encoding: "7bit")
    end
    #mail to: user.email, subject: "Password reset"
  end
end
