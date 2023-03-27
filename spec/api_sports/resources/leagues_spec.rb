# frozen_string_literal: true

RSpec.describe "Leagues" do
  it "can list leagues" do
    stub = stub_request("leagues", response: stub_response(fixture: "leagues/list"))
    client = create_test_client(stub: stub)
    leagues = client.leagues.list

    expect(leagues).to be_a(ApiSports::Collection)
    expect(leagues.total).to eq(3)
    expect(leagues.data.first.class).to eq(ApiSports::League)
    expect(leagues.data.first.league.name).to eq("Euro Championship")
    expect(leagues.data.first.seasons.first.year).to eq(2008)
  end

  it "can retrieve league by id" do
    stub = stub_request("leagues?id=39", response: stub_response(fixture: "leagues/retrieve"))
    client = create_test_client(stub: stub)
    league = client.leagues.retrieve(league_id: 39)

    expect(league).to be_a(ApiSports::League)
    expect(league.name).to eq("Premier League")
  end

  it "can retrieve seasons" do
    stub = stub_request("leagues/seasons", response: stub_response(fixture: "leagues/seasons"))
    client = create_test_client(stub: stub)
    seasons = client.leagues.seasons

    expect(seasons).to be_a(ApiSports::Collection)
    expect(seasons.total).to eq(17)
    expect(seasons.data.first.class).to eq(ApiSports::Season)
    expect(seasons.data.first.year).to eq(2008)
  end
end
