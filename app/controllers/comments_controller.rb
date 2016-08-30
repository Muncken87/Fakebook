class CommentsController < ApplicationController
  before_action :find_post

  def index
    @comments = @post.comment
  end

  def new
    @comment = Comment.new
    @comment = @post.comment.build
  end

  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    # @comment = @post.comments.create(params[:comment].permit[:content])
    # @comment.post_id = @post.id
     if @comment.save
        redirect_to root_path
      #  format.json { render :show, status: :created, location: @post }
      else
        render 'new'
      end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def comment_params
    #    params.require(:comment).permit(:content)
    # end

    def find_post
      @post = Post.find(params[:post_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
end
