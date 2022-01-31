json.extract! panel_ticket, :id, :title, :author_id, :text, :status, :created_at, :updated_at
json.url panel_ticket_url(panel_ticket, format: :json)
json.text panel_ticket.text.to_s
