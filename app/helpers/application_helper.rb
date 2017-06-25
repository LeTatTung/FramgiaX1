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
      comment_reply = comment.reply
      if comment_reply && comment_reply.user != comment.user
        link_to comment_reply.user.name, comment_reply.user
      end
    end
  end
end
