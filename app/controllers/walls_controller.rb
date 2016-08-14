class WallsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
    @post = Post.new
    @users = User.all
  end
end
