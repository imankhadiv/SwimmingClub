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

  def contact_user (users, subject, text,sender)
    @body = text
    @sender = sender
    # @user = user.first
    i = Array.new
    users.each do |item|
      i << item.id
    end
    @recipients = User.where(id: i).pluck(:email)
    mail(to: (@recipients.uniq), subject: subject)
    # mail(to: users.pluck(:email), subject: subject)
    # mail(to: User.where(users).pluck(:email), subject: subject)
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
