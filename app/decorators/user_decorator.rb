class UserDecorator < ApplicationDecorator
  def full_name
    result = "#{first_name} #{last_name}"
    result.strip.length.positive? ? result : email
  end

  def full_name_with_email
    result = "#{first_name} #{last_name}"
    result.strip.length.positive? ? "#{result} (#{email})" : email
  end

  def team_name
    current_team.name
  end
end
