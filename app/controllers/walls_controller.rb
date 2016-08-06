class WallsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    @users = User.all
  end
end
