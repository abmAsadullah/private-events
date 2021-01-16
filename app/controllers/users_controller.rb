class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
        @upcoming_events = @user.attended_events.upcoming
        @prev_events = @user.attended_events.past

    end
end
