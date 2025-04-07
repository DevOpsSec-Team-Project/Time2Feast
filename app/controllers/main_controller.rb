class MainController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).all
  end

  def profile
    @user = User.find(params[:id])
  end

  def users
    @users = User.all
  end
end
