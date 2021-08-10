class UserMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def notify_user(user_activity_id)
  	@user_activity = UserActivity.find_by(id: user_activity_id)
  	mail to: user_activity.user.email, subject: "User Updated"
  end
end