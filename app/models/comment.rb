class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_rich_text :content

  def broadcast_append_to_campaign(current_user)
    broadcast_append_to "comments-for-campaign-#{campaign_id}",
                        target: "comments-form-campaign-#{campaign_id}",
                        partial: 'panel/campaigns/comments/comment',
                        locals: { comment: self, current_user: current_user }
  end

  def broadcast_hide_form
    broadcast_replace_to ActionView::RecordIdentifier.dom_id(campaign, "comments-form-for"),
                         target: ActionView::RecordIdentifier.dom_id(campaign, "comments-form-for"),
                         partial: 'panel/campaigns/comments/add_comment_btn',
                         locals: { campaign: campaign }
  end
end
