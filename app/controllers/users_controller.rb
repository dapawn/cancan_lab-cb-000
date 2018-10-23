class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'show'
  end

  def show
    @user = User.find_by(:id)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
