module Panel
  class SettingsController < Panel::ApplicationController
    include ActionView::RecordIdentifier

    def show(); end

    def edit(); end

    def update
      current_user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar].present?
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
      params.require(:user).permit(:email, :password, :password_confirmation, :personal_api_token,
                                   :first_name, :last_name)
    end
  end
end
