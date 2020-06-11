class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    # Get a list of all users
    # Requests: GET
    def index
        @users = User.all
    end

    # Get user dashboard
    # Requests: GET
    def show
        @users = User.all
    end

    def claimed
        @auctions = Auction.where(buyer_id: current_user.id)
    end

    def sold
        @auctions = Auction.where(user: current_user)
    end
end