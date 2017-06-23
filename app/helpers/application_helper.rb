module ApplicationHelper
  def avatar_profile user
    if user
      @avatar = user.avatar_url
      if user && @avatar
        @avatar
      else
        "#{user.sex}.png"
      end
    end
  end
end
