class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def in_progress?(auction)
    DateTime.now.between?(DateTime.now, auction.deadline)
  end

  def auction_over?(auction)
    auction.deadline < DateTime.now
  end

  def can_bid?(auction, amount)
    amount >= auction.starting_bid && amount >= auction.current_price && !auction_over?(auction)
  end


end
