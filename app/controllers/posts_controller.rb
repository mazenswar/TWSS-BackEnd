class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.create(post_params)
    @user = User.find(user_id_params[:user_id])
    @user.posts << @post
    render json: { post: @post, user: @user}
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def update
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    if !@post.likes.any? {|like| like.user === @user}
      @like = Like.new(user: @user, post: @post)
      @post.likes << @like
      render json: { post: @post, like: @like }
    else
      render json: {error: "user already liked this post"}
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def search
    @list = Post.all + User.all + Person.all
    render json: @list
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def user_id_params
    params.permit(:user_id)
  end

end
