module Panel
  class Team < ApplicationRecord
    has_logidze
    has_one_attached :logo
    has_and_belongs_to_many :users, foreign_key: :panel_team_id
  end
end
