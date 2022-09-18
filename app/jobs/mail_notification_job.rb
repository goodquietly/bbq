class MailNotificationJob < ApplicationJob
  queue_as :default

  def perform(model)
    all_emails = (model.event.subscriptions.map(&:user_email) + [model.event.user.email]).uniq - [model.user&.email]

    case model
    when Subscription
      EventMailer.subscription(model).deliver_later
    when Comment
      all_emails.each do |mail|
        EventMailer.comment(model, mail).deliver_later
      end
    when Photo
      all_emails.each do |mail|
        EventMailer.photo(model, mail).deliver_later
      end
    end
  end
end
