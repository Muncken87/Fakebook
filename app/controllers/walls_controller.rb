class WallsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
    @post = Post.new
    @user = User.all
  end

end
