json.extract! auction, :id, :name, :description, :starting_bid, :deadline, :bidder, :current_price, :created_at, :updated_at
json.url auction_url(auction, format: :json)
