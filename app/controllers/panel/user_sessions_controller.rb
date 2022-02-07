# frozen_string_literal: true

module Panel
  # Show login form for a user
  class UserSessionsController < ApplicationController
    def new
      @user_session = UserSession.new
    end

    def create
      @user_session = UserSession.new(user_session_params.to_h)
      if @user_session.save
        redirect_to root_url
      else
        render action: :new
      end
    end

    private

    def user_session_params
      params.require(:user_session).permit(:email, :password)
    end
  end
end
