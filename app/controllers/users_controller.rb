class UsersController < ApplicationController
    
    # Get a list of all users
    # Requests: GET
    def index
        @users = User.all
    end

    # Get user dashboard
    # Requests: GET
    def show
    end
end