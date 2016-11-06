class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :user_have_right?, only: [:update, :destroy]
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

  def destroy
    @post.remove_image!
    @post.destroy
    flash[:success] = "Post delted!"
    redirect_to "/"
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated!"
      redirect_to @post
    else
      render "edit"
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to @post
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :remove_image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def user_have_right?
    find_post
    if !(current_user == @post.user || current_user.admin?)
      flash[:success] = "You dont have permission to do it!"
      redirect_to post_path
    end
  end

end
