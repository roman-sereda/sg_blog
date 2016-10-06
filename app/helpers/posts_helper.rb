module PostsHelper

  def get_limited_version body
     "#{body[1, 80]}..."
  end

  def choose_button_name body
    body==nil ? "Create post" : "Update post"
  end
end
