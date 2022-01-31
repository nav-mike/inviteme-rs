class Notification
  TYPES = %w[info success warning error].freeze
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

  attr_reader :title, :message

  def initialize(type, title, message)
    super()
    raise ArgumentError, "Type should be in #{TYPES}" unless TYPES.include?(type.to_s)

    @type = type.to_s
    @title = title
    @message = message
  end

  def icon
    ICONS[@type]
  end

  def color
    COLORS[@type]
  end
end
