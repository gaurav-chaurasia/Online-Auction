class ApplicationController < ActionController::Base
    add_flash_types :success, :warning, :danger, :info
  
    helper_method :get_user, :in_progress?, :can_vote?
    
    def get_user(user_id)
        @get_user = User.find(user_id)
    end

    def in_progress?(auction_id)
        @auction = Auction.find(auction_id)
        return @auction.deadline > DateTime.now
    end

    def can_vote?(auction_id, amount)
        @auction = Auction.find(auction_id)
        return amount > @auction.current_price && in_progress?(auction_id) && @auction.user != current_user
    end
end
