class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
  end

  def search
    @users = User.where('name ILIKE ?', "%#{params[:query]}%")
    render json: @users
  end
end
