class Promoter < ApplicationRecord
  has_logidze

  belongs_to :campaign

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { scope: :campaign_id }
  validates :token, presence: true, uniqueness: true
  validates :campaign_id
end
