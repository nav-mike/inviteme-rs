module Panel
  class Team < ApplicationRecord
    has_logidze

    has_one_attached :logo do |attachable|
      attachable.variant :thumb, resize_to_limit: [128, 128]
      attachable.variant :micro, resize_to_limit: [20, 20]
      attachable.variant :medium, resize_to_limit: [256, 256]
    end

    has_and_belongs_to_many :users, foreign_key: :panel_team_id
    has_many :campaigns, dependent: :destroy

    def update_team_turbo(current_user)
      broadcast_replace_to "teams-list-for-#{current_user.id}",
                           target: "teams-list-for-#{current_user.id}",
                           partial: 'panel/users/current_team',
                           locals: { user: current_user }
    end
  end
end
