# frozen_string_literal: true

module ApplicationHelper
  def show_notice(notice, alert)
    html = ''
    html += "<div class='notice'><p>#{notice}</p></div>" if notice.present?
    html += "<div class='alert'><p>#{alert}</p></div>" if notice.present?
    html.html_safe
  end

  def at_name(user)
    "@#{user.username.downcase}"
  end
end
