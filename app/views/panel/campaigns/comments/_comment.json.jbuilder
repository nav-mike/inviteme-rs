json.extract! comment, :id, :content, :user_id, :campaign_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
json.content comment.content.to_s
