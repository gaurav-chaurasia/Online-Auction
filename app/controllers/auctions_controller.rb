class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_auction, only: [:show, :edit, :update, :destroy]

  # GET /auctions
  # GET /auctions.json
  def index
    @auctions = Auction.all.order(created_at: :desc)
    # newer products first
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  # GET /auctions/1/edit
  def edit
  end

  # POST /auctions
  # POST /auctions.json
  def create
    @auction = Auction.new(auction_params)
    @auction.create_auction(current_user)
    
    # @auction.user = current_user
    # @auction.current_price = @auction.starting_bid
    
    respond_to do |format|
      if @auction.save
        format.html { redirect_to @auction, success: 'Auction was successfully created.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  def claim
    @auction = Auction.find(params[:id])
    @auction.set_buyer(current_user.id)
    
    # @auction.buyer_id = current_user.id
    # print "check 1 2 3 " + @auction.buyer_id 
    # print "1 2 3 check"
      
    respond_to do |format|
      if @auction.save
        # print "check 1 2 3 " + @auction.name
          format.html { redirect_to @auction, success: 'you have successfully claimed the product!!' }
      else
          format.html { redirect_to @auction, danger: 'Somthing went wrong!!' }
      end
    end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, success: 'Auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, danger: 'Product is successfully removeld from auction.' }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auction_params
      params.require(:auction).permit(:name, :description, :starting_bid, :deadline, :bidder, :current_price, :image)
    end
  
end