class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_filter :find_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], :per_page => 12)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def destroy
    @post.remove_image!
    @post.destroy
    redirect_to "/"
  end

  def update
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post updated!"
      redirect_to root_url
    else
      redirect_to new_post_path
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      redirect_to new_post_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
