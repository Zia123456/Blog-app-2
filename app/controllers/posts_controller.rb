class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
