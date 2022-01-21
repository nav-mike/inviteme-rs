class Campaign < ApplicationRecord
  has_logidze
  paginates_per 25

  belongs_to :owner, class_name: 'User'
end
