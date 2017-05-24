module ApplicationHelper
  def avatar_profile user
    if user.avatar
      user.avatar.url
    else
      "#{user.sex}.png"
    end
  end
end
