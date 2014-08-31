class UserNotifier < ActionMailer::Base
  default from: 'stucat007@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.activated.subject
  #
  def activated user

    @user = user
    mail(to: user.email, subject: 'Your Account has been updated')
  end

  def contact_user (user, subject, text,sender)
    @body = text
    @sender = sender
    @user = user

    mail(to: user.email, subject: subject)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.suspended.subject
  #
  def suspended
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
