class WallsController < ApplicationController
  def index
    @walls = Post.all
    @posts = Post.all
  end
end
