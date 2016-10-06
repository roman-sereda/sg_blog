module PostsHelper
  def get_limited_version body
     "#{body[1, 80]}..."
  end
end
