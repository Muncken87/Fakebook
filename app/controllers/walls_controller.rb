class WallsController < ApplicationController
  respond_to :json, :html
  def index
    @posts = Post.order("created_at DESC")
    @post = Post.new
    @walls = Wall.all.includes(:user, :post).to_json(:include => [{post: {only: %i(username image content)}},{:user => {only: %i(id)}}])
    respond_with @wall
  end

end
