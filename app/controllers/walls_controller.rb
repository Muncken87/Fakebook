class WallsController < ApplicationController
  respond_to :json, :html
  before_action :authenticate_user!

  def index
    @posts = Post.order("created_at DESC")
    @post = Post.new
    @walls = Wall.all.includes(:user, :post, :comment).to_json(:include => [{post: {only: %i(username image content youtube_url)}},{:user => {only: %i(id)}},{:comment => {only: %i(content)}}])
    respond_with @wall
    @user = User.all
    @comment = Comment.new
    @comment = @post.comments
  end
end
