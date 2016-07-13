class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @github_user = GithubUser.find(@user)
  end
end
