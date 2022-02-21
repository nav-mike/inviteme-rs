module Panel
  # Panel application controller
  class ApplicationController < ApplicationController
    before_action :define_header_user_data, :notifications

    layout 'panel'

    private

    def notifications
      @notifications = NotificationDecorator.decorate_collection(
        Notification.none
      )
      @notifications_count = Notification.where(user: current_user, seen: false).action_required.count
    end

    def define_header_user_data
      @header_user = UserDecorator.decorate(current_user)
    end
  end
end
