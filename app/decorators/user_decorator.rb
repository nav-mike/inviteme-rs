class UserDecorator < ApplicationDecorator
  def full_name
    result = "#{first_name} #{last_name}"
    result.strip.length.positive? ? result : email
  end
end