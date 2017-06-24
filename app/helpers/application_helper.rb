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

  def user_reply_comment comment
    if comment
      comment_reply = comment.reply_comment
      user_reply = comment_reply.user
      if comment_reply && user_reply != comment.user
        link_to user_reply.name, "#"
      end
    end
  end
end
