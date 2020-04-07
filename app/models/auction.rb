class Auction < ApplicationRecord
    belongs_to :user
    has_many :bids #many to many assosiation 
    has_one_attached :image

end
