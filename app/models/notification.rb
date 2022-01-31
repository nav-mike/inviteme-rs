class Notification < ApplicationRecord
  belongs_to :user

  enum message_type: { info: 0, success: 1, warning: 2, error: 3 }

  after_save_commit do
    broadcast_replace_to "notification-count-#{user_id}",
                         target: "notification-count-#{user_id}",
                         partial: 'shared/panel/notifications_icon',
                         locals: { count: Notification.where(user_id: user_id, seen: false).size, user_id: user_id }
  end
end
