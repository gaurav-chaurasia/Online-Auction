class Auction < ApplicationRecord
    belongs_to :user
    has_many :bids #many to many assosiation 
    has_one_attached :image

    def claimed_product
        return self.buyer_id != null
    end

    def create_auction(current_user)
        self.user = current_user
        self.current_price = self.starting_bid
    end

    def set_buyer(id)
        self.buyer_id = id
    end
end
