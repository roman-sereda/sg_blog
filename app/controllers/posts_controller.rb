class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def posts_show_page
    @post=Post.find(params[:id])
  end

end
