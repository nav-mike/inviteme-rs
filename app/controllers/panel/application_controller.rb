module Panel
  # Panel application controller
  class ApplicationController < ApplicationController
    helper_method :current_user, :current_user_session

    before_action :define_header_user_data

    private

    def define_header_user_data
      @header_user = UserDecorator.decorate(current_user)
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)

      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)

      @current_user = current_user_session && current_user_session.user
    end
  end
end
