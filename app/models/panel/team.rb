module Panel
  class Team < ApplicationRecord
    has_one_attached :logo
  end
end
