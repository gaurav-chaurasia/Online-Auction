class BidsController < ApplicationController 
    before_action :set_bid, only: [:show, :edit, :update, :destroy]
    # Requests: GET
    def index
        @auction = Auction.find(params[:item_id])
        @bid = @auction.bids.build
        # @bids = current_user.bids
    end

    # Requests: GET
    def new
        @bid = Bid.new
    end

    # Requests: GET
    def edit
    end

    # after new create action POST and takes care of submmition
    # Requests: POST
    def create
        @auction = Auction.find(params[:auction_id])
        @bid = @auction.bids.new(bid_params)

        # @bid = Bid.new(bid_params)
        # @auction = Auction.find(params[:auction_id])
        if can_bid(@auction)? 
            @bid.user = current_user
            @bid.auction = @auction
            @auction.bidder = current_user
            update_auction

            respond_to do |format|
            if @bid.save
                format.html { redirect_to user(current_user), success: 'Bid was successfully created.' }
                # redirect_to user(current_user)
                # :success 'Bid was successfully created.'
            else
                format.html { render 'new', danger: 'Something went wrong Bid not created!' }
                # render 'new'
                # :danger 'Something went wrong Bid not created!'  
            end
        end
    end

    # after edit update action PATCH /PUT and takes care of submmition 
    # Requests: Patch/Put 
    def update
        if @bid.update(bid_params)
            redirect_to user(current_user)
            # :success 'Bid is updated successfully'
        else
            render 'edit'
            # :info 'Bid could not be updated'
        end
    end

    private

    def set_bid
        @bid = Bid.find(params[:id])
    end
      
    def bid_params
        params.require(:bid).permit(:amount)
    end
    
    def update_auction
        @auction.current_price = @bid.amount
        @auction.save
    end
end