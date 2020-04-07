class BidsController < ApplicationController 
    before_action :set_bid, only: [:show, :edit, :update]
    # Requests: GET
    def index
        @auction = Auction.find(params[:auction_id])
        @bid = Bid.all
        # @bids = current_user.bids
    end

    # Requests: GET
    def new
        @bid = Bid.new
        @id = params[:id]
        # @auction = Auction.find(params[:id])
        # @id = params.dig(:new, :id) 
    end

    # Requests: GET
    def edit
    end

    # after new create action POST and takes care of submmition
    # Requests: POST
    def create
        @auction = Auction.find(params[:auction_id])
        # print "check" + params[:auction_id]
        # print "check" + params[:create][:auction_id]
        @bid = Bid.new(@bid_params)
        @bid.amount = params[:bid][:amount]

        if ( true )
            @bid.user = current_user
            @bid.auction_id = @auction.id
            @auction.bidder_id = current_user.id
            @auction.current_price = @bid.amount
            @auction.save
        # print "check" + params[:auction_id]

        # print params[:bid][:amount]
            respond_to do |format|
            if @bid.save
                format.html { redirect_to auctions_path, success: 'Bid was successfully created.' }
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
            redirect_to user_path(current_user)
            # :success 'Bid is updated successfully'
        else
            render 'edit'
            # :info 'Bid could not be updated'
        end
    end

# private

        def set_bid
            @bid = Bid.find(params[:id])
        end
        
        def bid_params
            params.require(:bid).permit(:amount, :auction_id, :id)
        end
        
    end 
end