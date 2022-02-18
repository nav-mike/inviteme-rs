class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_rich_text :content

  def broadcast_append_to_campaign(current_user)
    broadcast_append_to "comments-for-campaign-#{campaign_id}",
                        target: "comments-form-campaign-#{campaign_id}",
                        partial: 'comments/comment',
                        locals: { comment: self, current_user: current_user }
  end
end
