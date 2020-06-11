class BidsController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_bid, only: []
    
    # Requests: GET
    def index #show all bids assosiated to a specific product/auction
        @auction = Auction.find(params[:id])
        @bids = Bid.where(auction: @auction)
    end    
    
    # Requests: GET
    def cart #show all the product in which current user has done bidding
        # @auction = Auction.find(params[:auction_id])
        @bids = Bid.where(user: current_user)
    end

    # Requests: GET
    def new
        @bid = Bid.new
        @id = params[:id]
        # @auction = Auction.find(params[:id])
        # @id = params.dig(:new, :id) 
    end

    # # Requests: GET
    # def edit
    # end

    # after new create action POST and takes care of submmition
    # Requests: POST
    def create
        @auction = Auction.find(params[:auction_id])
        
        @bid = Bid.new(@bid_params)
        @bid.amount = params[:bid][:amount]

        if ( @auction != nil and @bid.amount != nil and can_vote?(@auction.id, @bid.amount) )
            @bid.user = current_user
            @bid.auction_id = @auction.id
            @auction.bidder_id = current_user.id
            @auction.current_price = @bid.amount
            @auction.save
            # print "check" + params[:auction_id]
            # print params[:bid][:amount]
            
            respond_to do |format|
            if @bid.save
                format.html { redirect_to bids_path(:id => @auction.id), success: 'Bid was successfully created.' }
                # redirect_to user(current_user)
                # :success 'Bid was successfully created.'
            else
                format.html { redirect_to auction_path(@auction), danger: 'Something went wrong Bid not created!' }
                # render 'new'
                # :danger 'Something went wrong Bid not created!'  
            end
        end
        else
            respond_to do |format|
            format.html { redirect_to auction_path(@auction), info: 'You can not bid less than current price or no your own products' }
        end
    end


    # after edit update action PATCH /PUT and takes care of submmition 
    # Requests: Patch/Put 
    # def update
    #     if @bid.update(bid_params)
    #         redirect_to user_path(current_user)
    #         # :success 'Bid is updated successfully'
    #     else
    #         render 'edit'
    #         # :info 'Bid could not be updated'
    #     end
    # end

# private

        def set_bid
            @bid = Bid.find(params[:id])
        end
        
        def bid_params
            params.require(:bid).permit(:amount, :auction_id, :id)
        end
        
    end
end