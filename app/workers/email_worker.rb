class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(**options)
    begin
      options.symbolize_keys!

      # Turn option like :user into a Mailer class, for example:
      # :admin  ===> AdminMailer
      mailer_type = options.delete :mailer_type
      mailer_class = (mailer_type.to_s.capitalize << "Mailer").constantize
      email_type = options.delete :email_type

      mailer_class.send(email_type, options).deliver
    end
  end
end

