# frozen_string_literal: true

RSpec.describe "Odds" do
  it "can retrieve pre-match odds for a fixture" do
    stub = stub_request("odds?bookmaker=6&fixture=980480", response: stub_response(fixture: "odds/pre_match_odds"))
    client = create_test_client(stub: stub)
    odds = client.odds.pre_match_odds(fixture_id: 980480, bookmaker_id: 6)

    expect(odds).to be_a(ApiSports::Collection)
    expect(odds.data.first.class).to eq(ApiSports::Odds)
    expect(odds.data.first.bookmakers.first.bets.first.name).to eq("Match Winner")
  end

  it "can retrieve mapping of fixtures for which odds available" do
    stub = stub_request("odds/mapping", response: stub_response(fixture: "odds/mapping"))
    client = create_test_client(stub: stub)
    mappings = client.odds.mapping

    expect(mappings).to be_a(ApiSports::Collection)
    expect(mappings.data.first.class).to eq(ApiSports::Fixture)
    expect(mappings.data.first.fixture.id).to eq(856816)
  end

  it "can retrieve list of bookmarkers" do
    stub = stub_request("odds/bookmakers", response: stub_response(fixture: "odds/bookmakers"))
    client = create_test_client(stub: stub)
    response = client.odds.bookmakers

    expect(response).to be_a(ApiSports::Collection)
    expect(response.data.count).to eq(28)
    expect(response.data.first.class).to eq(ApiSports::Bookmaker)
    expect(response.data.first.name).to eq("10Bet")
  end

  it "can retrieve pre-match bet types" do
    stub = stub_request("odds/bets", response: stub_response(fixture: "odds/pre_match_bets"))
    client = create_test_client(stub: stub)
    response = client.odds.pre_match_bets

    expect(response).to be_a(ApiSports::Collection)
    expect(response.data.count).to eq(168)
    expect(response.data.first.class).to eq(ApiSports::Bet)
    expect(response.data.first.name).to eq("Match Winner")
  end

  it "can retrieve live odds for a fixture" do
    stub = stub_request("odds/live?fixture=980486", response: stub_response(fixture: "odds/live_odds"))
    client = create_test_client(stub: stub)
    odds = client.odds.live_odds(fixture_id: 980486)

    expect(odds).to be_a(ApiSports::Collection)
    expect(odds.data.first.class).to eq(ApiSports::Odds)
    expect(odds.data.first.odds.first.name).to eq("Match Corners")
  end

  it "can retrieve list of live bet types" do
    stub = stub_request("odds/live/bets", response: stub_response(fixture: "odds/live_bets"))
    client = create_test_client(stub: stub)
    odds = client.odds.live_bets

    expect(odds).to be_a(ApiSports::Collection)
    expect(odds.data.first.class).to eq(ApiSports::Bet)
    expect(odds.data.first.name).to eq("Over/Under Extra Time")
  end
end
