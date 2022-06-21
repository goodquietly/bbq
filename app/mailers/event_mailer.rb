class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: t('mailer.new_subscription', event_title: event.title)
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: t('mailer.new_comment', event_title: event.title)
  end

  def photo(photo, email)
    @photo = photo

    mail to: email, subject: t('mailer.new_photo', event_title: photo.event.title)
  end
end
