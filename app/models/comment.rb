class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_rich_text :content
end
