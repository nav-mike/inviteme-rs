module Panel
  class Team < ApplicationRecord
    has_logidze
    has_one_attached :logo
  end
end
