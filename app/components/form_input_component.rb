# frozen_string_literal: true

class FormInputComponent < ViewComponent::Base
  def initialize(form:, field:, label:, placeholder:)
    super()
    @form = form
    @field = field
    @label = label
    @placeholder = placeholder
  end
end
