module CommentsHelper
  def comment_body comment
        "<span class='comment-created-at'>#{comment.created_at.strftime("%H:%M %Y-%m-%d")}</span>".html_safe +
        "#{ comment.user.name } ".html_safe +
        "<div class='comment-body'>#{comment.body}</div>".html_safe
  end
end
