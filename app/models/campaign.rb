class Campaign < ApplicationRecord
  has_logidze
  paginates_per 25

  belongs_to :owner, class_name: 'User'

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: :owner_id }
  validates :token, presence: true, uniqueness: true
end
