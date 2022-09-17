class MailNotificationJob < ApplicationJob
  queue_as :default

  def perform(model)
    case model
    when Subscription
      EventMailer.subscription(model).deliver_later
    end
  end
end
