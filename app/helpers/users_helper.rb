# frozen_string_literal: true

module UsersHelper
  def can_follows(user, users)
    safe_join(
      users.filter { |u| u.id != user.id && !user.following?(u) }.map { |u| render 'follow_form', user: u }
    )
  end

  def user_followers(users)
    safe_join(
      users.map { |u| render 'profile', user: u }
    )
  end
end
