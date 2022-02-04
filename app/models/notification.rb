class Notification < ApplicationRecord
  belongs_to :user

  enum message_type: { info: 0, success: 1, warning: 2, error: 3 }
  enum notification_type: { simple: 0, action_required: 1 }

  validates :title, presence: true
  validates :message, presence: true
  validates :message_type, presence: true

  after_create_commit do
    if action_required?
      broadcast_replace_to "notification-count-#{user_id}",
                           target: "notification-count-#{user_id}",
                           partial: 'shared/panel/notifications_icon',
                           locals: { count: Notification.where(user_id: user_id, seen: false).action_required.size,
                                     user_id: user_id }
    else
      broadcast_prepend_to "notifications-#{user_id}",
                           target: "notifications-#{user_id}",
                           partial: "notifications/notification/#{message_type}",
                           locals: { notification: NotificationDecorator.decorate(self), user_id: user_id }
    end
  end

  after_destroy_commit do
    if action_required?
      broadcast_replace_to "notification-count-#{user_id}",
                           target: "notification-count-#{user_id}",
                           partial: 'shared/panel/notifications_icon',
                           locals: { count: Notification.where(user_id: user_id, seen: false).action_required.size,
                                     user_id: user_id }
    end

    broadcast_remove_to "notifications-#{user_id}"
  end
end
