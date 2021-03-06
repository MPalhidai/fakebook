class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "You have successfully made a post."
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "Something went wrong saving your post."
      render :new
    end
  end

  def show #what is the post going to look like
    post
  end

  def destroy
    post.destroy
    flash[:success] = "You have successfully deleted your post."
    redirect_to user_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def post
    @post ||= Post.find(params[:id])
  end
end
