class UserNotifier < ActionMailer::Base
  default from: 'instructor@jasonnoble.org'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.signed_up.subject
  #
  def signed_up(user)
    @user = user
    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.verified.subject
  #
  def verified
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.verify.subject
  #
  def verify
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
