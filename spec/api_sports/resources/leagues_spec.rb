# frozen_string_literal: true

RSpec.describe "Leagues" do
  it "can list leagues" do
    stub = stub_request("leagues", response: stub_response(fixture: "leagues/list"))
    client = ApiSports::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    leagues = client.leagues.list

    expect(leagues).to be_a(ApiSports::Collection)
    expect(leagues.total).to eq(3)
    expect(leagues.data.first.class).to eq(ApiSports::League)
    expect(leagues.data.first.league.name).to eq("Euro Championship")
    expect(leagues.data.first.seasons.first.year).to eq(2008)
  end

  it "can retrieve league by id" do
    stub = stub_request("leagues", response: stub_response(fixture: "leagues/retrieve"))
    client = ApiSports::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    league = client.leagues.retrieve(league_id: 39)

    expect(league).to be_a(ApiSports::League)
    expect(league.name).to eq("Premier League")
  end
end
