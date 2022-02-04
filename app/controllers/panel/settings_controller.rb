module Panel
  class SettingsController < Panel::ApplicationController
    def show(); end

    def edit(); end

    def update
      if current_user.update current_user_params
        Notification.create title: 'Settings updated',
                            message: 'Your settings have been updated.',
                            user: current_user,
                            message_type: 'success'

        redirect_to panel_show_settings_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def current_user_params
      params.require(:user).permit(:email)
    end
  end
end
