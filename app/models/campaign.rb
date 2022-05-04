class Campaign < ApplicationRecord
  has_logidze

  attr_accessor :name, :owner, :token, :amount, :created_at, :updated_at, :panel_team

  belongs_to :owner, class_name: 'User'
  belongs_to :panel_team, class_name: 'Panel::Team'
  has_many :promoters, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: :owner_id }
  validates :token, presence: true, uniqueness: true
end
