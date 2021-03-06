class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    current_user = @user
    @created_events = current_user.events
    @upcoming_events = @user.attended_events.upcoming
    @prev_events = @user.attended_events.past
  end
end
