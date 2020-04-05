class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  def can_bid(@auction)?
    @bid.amount >= @auction.starting_bid && @bid.amount >= @auction.current_price && !auction_over?
  end


end
