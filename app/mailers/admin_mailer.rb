class AdminMailer < ActionMailer::Base
  default to: Proc.new { AdminUser.pluck(:email) },
          from: 'test_photo@example.com'

  def new_upload(**options)
    username = Photo.find(options[:photo_id]).user.name
    @subject = "#{username} uploaded a photo"
    mail(subject: "New upload")
  end
end
