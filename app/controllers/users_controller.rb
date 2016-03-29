class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas
    @likes = @user.likes
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully registered"
      redirect_to "/"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    # if @user.update(user_params)
    #   flash[:success] = "User has been updated"
    #   redirect_to "/users/#{@user.id}"
    # else
    #   flash[:errors] = @user.errors.full_messages
    #   redirect_to :back
    # end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = nil
    redirect_to "/sessions"
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation, :user_id)
    end
end
