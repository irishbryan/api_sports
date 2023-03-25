# frozen_string_literal: true

RSpec.describe "Standings" do
  it "can retrieve league table standings" do
    stub = stub_request("standings?league=39&season=2022", response: stub_response(fixture: "standings/retrieve"))
    client = create_test_client(stub: stub)
    standings = client.standings.retrieve(league_id: 39, season_id: 2022)

    expect(standings).to be_a(ApiSports::Collection)
    expect(standings.data.count).to eq(20)
    expect(standings.data.first.class).to eq(ApiSports::Standing)
    expect(standings.data[2].rank).to eq(3)
  end

  it "can retrieve a team's standing" do
    stub = stub_request("standings?league=39&season=2022&team=33", response: stub_response(fixture: "standings/retrieve_by_team"))
    client = create_test_client(stub: stub)
    standings = client.standings.retrieve(league_id: 39, season_id: 2022, team_id: 33)

    expect(standings).to be_a(ApiSports::Collection)
    expect(standings.data.count).to eq(1)
    expect(standings.data.first.class).to eq(ApiSports::Standing)
    expect(standings.data.first.team.name).to eq("Manchester United")
  end
end
