module CommentsHelper
  def comment_body comment
    "<div class='comment panel panel-default'><p class='comment-created-at'>#{}#{comment.created_at.strftime("%H:%M %Y-%m-%d")}</p><p class='comment-body'>#{comment.body}</p></div>".html_safe
  end
end
