require "application_system_test_case"

class AuctionsTest < ApplicationSystemTestCase
  setup do
    @auction = auctions(:one)
  end

  test "visiting the index" do
    visit auctions_url
    assert_selector "h1", text: "Auctions"
  end

  test "creating a Auction" do
    visit auctions_url
    click_on "New Auction"

    fill_in "Bidder", with: @auction.bidder
    fill_in "Current price", with: @auction.current_price
    fill_in "Deadline", with: @auction.deadline
    fill_in "Description", with: @auction.description
    fill_in "Name", with: @auction.name
    fill_in "Starting bid", with: @auction.starting_bid
    click_on "Create Auction"

    assert_text "Auction was successfully created"
    click_on "Back"
  end

  test "updating a Auction" do
    visit auctions_url
    click_on "Edit", match: :first

    fill_in "Bidder", with: @auction.bidder
    fill_in "Current price", with: @auction.current_price
    fill_in "Deadline", with: @auction.deadline
    fill_in "Description", with: @auction.description
    fill_in "Name", with: @auction.name
    fill_in "Starting bid", with: @auction.starting_bid
    click_on "Update Auction"

    assert_text "Auction was successfully updated"
    click_on "Back"
  end

  test "destroying a Auction" do
    visit auctions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Auction was successfully destroyed"
  end
end
