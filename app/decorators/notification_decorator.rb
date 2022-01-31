class NotificationDecorator < ApplicationDecorator
  ICONS = {
    'info' => 'info-circle',
    'success' => 'check-square',
    'warning' => 'question-circle',
    'error' => 'exclamation-triangle'
  }.freeze
  COLORS = {
    'info' => 'blue',
    'success' => 'green',
    'warning' => 'yellow',
    'error' => 'red'
  }.freeze

  def icon
    ICONS[message_type]
  end

  def color
    COLORS[message_type]
  end
end
