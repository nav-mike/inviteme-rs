class Campaign < ApplicationRecord
  has_logidze

  belongs_to :owner, class_name: 'User'
  has_many :promoters, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: :owner_id }
  validates :token, presence: true, uniqueness: true
end
