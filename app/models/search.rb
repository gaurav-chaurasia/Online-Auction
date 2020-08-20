class Search < ApplicationRecord
    def search_auctions
        auctions = Auction.all # retrive all data present

        # if keywords.present?
        #     auctions = Auction.where(["name LIKE ?", "%#{keywords}%"])
        #     auctions = Auction.where(["current_price >= ? and name LIKE ?", min_price, "%#{keywords}%"]) if min_price.present? and !max_price.present?
        #     auctions = Auction.where(["current_price <= ? and name LIKE ?", max_price, "%#{keywords}%"]) if max_price.present? and !min_price.present?
        #     auctions = Auction.where(["current_price <= ? and current_price >= ? and name LIKE ?", max_price, min_price, "%#{keywords}%"]) if max_price.present? and min_price.present?
        # else 
        #     auctions = Auction.where(["current_price >= ?", min_price]) if min_price.present? and !max_price.present?
        #     auctions = Auction.where(["current_price <= ?", max_price]) if max_price.present? and !min_price.present?
        #     auctions = Auction.where(["current_price <= ? and current_price >= ?", max_price, min_price]) if max_price.present? and min_price.present?
        # end
        
        auctions = auctions.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present? 
        auctions = auctions.where(["current_price >= ?", min_price]) if min_price.present?
        auctions = auctions.where(["current_price <= ?", max_price]) if max_price.present?

        return auctions
    end
end
