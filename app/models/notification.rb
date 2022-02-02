class Notification < ApplicationRecord
  belongs_to :user

  enum message_type: { info: 0, success: 1, warning: 2, error: 3 }

  validates :title, presence: true
  validates :message, presence: true
  validates :message_type, presence: true

  after_create_commit do
    broadcast_replace_to "notification-count-#{user_id}",
                         target: "notification-count-#{user_id}",
                         partial: 'shared/panel/notifications_icon',
                         locals: { count: Notification.where(user_id: user_id, seen: false).size, user_id: user_id }

    broadcast_prepend_to "notifications-#{user_id}",
                         target: "notifications-#{user_id}",
                         partial: "notifications/notification/#{message_type}",
                         locals: { notification: NotificationDecorator.decorate(self), user_id: user_id }
  end

  after_destroy_commit do
    broadcast_replace_to "notification-count-#{user_id}",
                         target: "notification-count-#{user_id}",
                         partial: 'shared/panel/notifications_icon',
                         locals: { count: Notification.where(user_id: user_id, seen: false).size, user_id: user_id }

    broadcast_remove_to "notifications-#{user_id}"
  end
end
