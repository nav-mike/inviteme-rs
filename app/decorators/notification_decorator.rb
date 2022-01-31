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
    ICONS[type]
  end

  def color
    COLORS[type]
  end
end
