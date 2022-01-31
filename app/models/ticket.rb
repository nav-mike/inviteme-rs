class Ticket < ApplicationRecord
  has_logidze
  belongs_to :author, class_name: 'User'
  has_rich_text :message

  enum status: { pending: 0, confirmed: 1, answered: 2, updated: 3, closed: 4 }
end
