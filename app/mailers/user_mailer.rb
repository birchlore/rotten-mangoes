class UserMailer < ActionMailer::Base
  default from: "jackson@teachly.com"

  def delete_notification(user)
    @user = user
    mail(to: @user.email, subject: "You're outta here")
  end
end
