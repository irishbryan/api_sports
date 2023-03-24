# frozen_string_literal: true

RSpec.describe "Venues" do
  it "can retrieve specific venue" do
    stub = stub_request("venues?search=Old%20Trafford", response: stub_response(fixture: "venues/retrieve"))
    client = create_test_client(stub: stub)
    venue = client.venues.retrieve(search: "Old Trafford")

    expect(venue.class).to eq(ApiSports::Venue)
    expect(venue.name).to eq("Old Trafford")
    expect(venue.surface).to eq("grass")
  end
end
