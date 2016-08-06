class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
def index
  @user = User.all
end

def show
  @users = User.find(params[:id])
  @post = @user.posts(params[:page])
end

def new
  @user = User.new
end

def create
  byebug
  @user = User.new(user_params)
  @user.avatar = params[:avatar]
  respond_to do |format|
    if @user.save
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to @wall, notice: 'Post was successfully destroyed.' }
    format.json { head :no_content }
  end
end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
