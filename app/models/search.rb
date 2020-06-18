class Search < ApplicationRecord
    def search_auctions
        auctions = Auction.all

        auctions = Auction.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?
        auctions = Auction.where(["current_price >= ?", min_price]) if min_price.present?
        auctions = Auction.where(["current_price <= ?", max_price]) if max_price.present?

        return auctions
    end
end
