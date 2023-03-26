# frozen_string_literal: true

RSpec.describe "Fixtures" do
  it "can list fixture rounds" do
    stub = stub_request("fixtures/rounds?league=39&season=2022", response: stub_response(fixture: "fixtures/rounds"))
    client = create_test_client(stub: stub)
    rounds = client.fixtures.rounds(league_id: 39, season_id: 2022)

    expect(rounds).to be_a(ApiSports::Collection)
    expect(rounds.data.count).to eq(38)
    expect(rounds.data.first.class).to eq(ApiSports::FixtureRound)
    expect(rounds.data.first.name).to eq("Regular Season - 1")
  end

  it "can list current round fixtures only" do
    stub = stub_request("fixtures/rounds?league=39&season=2022&current=true", response: stub_response(fixture: "fixtures/rounds_current_only"))
    client = create_test_client(stub: stub)
    rounds = client.fixtures.rounds(league_id: 39, season_id: 2022, current_round_only: true)

    expect(rounds).to be_a(ApiSports::Collection)
    expect(rounds.data.count).to eq(1)
    expect(rounds.data.first.class).to eq(ApiSports::FixtureRound)
    expect(rounds.data.first.name).to eq("Regular Season - 29")
  end

  it "can list a team's fixtures for a season" do
    stub = stub_request("fixtures?league=39&season=2022&team=33", response: stub_response(fixture: "fixtures/list"))
    client = create_test_client(stub: stub)
    fixtures = client.fixtures.list(league: 39, season: 2022, team: 33)

    expect(fixtures).to be_a(ApiSports::Collection)
    expect(fixtures.data.count).to eq(38)
    expect(fixtures.data.first.class).to eq(ApiSports::Fixture)
    expect(fixtures.data.first.teams.home.name).to eq("Manchester United")
  end

  it "can list the head to head fixtures between two teams" do
    stub = stub_request("fixtures/headtohead?h2h=33-34", response: stub_response(fixture: "fixtures/head_to_head"))
    client = create_test_client(stub: stub)
    fixtures = client.fixtures.head_to_head(first_team_id: 33, second_team_id: 34)

    expect(fixtures).to be_a(ApiSports::Collection)
    expect(fixtures.data.count).to eq(2)
    expect(fixtures.data.first.class).to eq(ApiSports::Fixture)
    expect(fixtures.data.first.teams.home.name).to eq("Manchester United")
  end

  it "can retrieve a fixture's statistics" do
    stub = stub_request("fixtures/statistics?fixture=868021", response: stub_response(fixture: "fixtures/statistics"))
    client = create_test_client(stub: stub)
    statistics = client.fixtures.statistics(fixture_id: 868021)

    expect(statistics).to be_a(ApiSports::Collection)
    expect(statistics.data.count).to eq(2)
    expect(statistics.data.first.class).to eq(ApiSports::Statistics)
    expect(statistics.data.first.statistics.first[:value]).to eq(7)
  end

  it "can retrieve a fixture's events" do
    stub = stub_request("fixtures/events?fixture=868021", response: stub_response(fixture: "fixtures/events"))
    client = create_test_client(stub: stub)
    statistics = client.fixtures.events(fixture_id: 868021)

    expect(statistics).to be_a(ApiSports::Collection)
    expect(statistics.data.count).to eq(19)
    expect(statistics.data.first.class).to eq(ApiSports::Event)
    expect(statistics.data.last.player.name).to eq("W. Gnonto")
  end

  it "can retrieve a fixture's lineups" do
    stub = stub_request("fixtures/lineups?fixture=868021", response: stub_response(fixture: "fixtures/lineups"))
    client = create_test_client(stub: stub)
    lineups = client.fixtures.lineups(fixture_id: 868021)

    expect(lineups).to be_a(ApiSports::Collection)
    expect(lineups.data.count).to eq(2)
    expect(lineups.data.first.class).to eq(ApiSports::Lineup)
    expect(lineups.data.first.coach.name).to eq("E. ten Hag")
  end

  it "can retrieve a fixture's player stats" do
    stub = stub_request("fixtures/players?fixture=868021", response: stub_response(fixture: "fixtures/players"))
    client = create_test_client(stub: stub)
    players = client.fixtures.player_statistics(fixture_id: 868021)

    expect(players).to be_a(ApiSports::Collection)
    expect(players.data.first.class).to eq(ApiSports::Player)
    expect(players.data.first.players.first.player.name).to eq("David De Gea")
    expect(players.data.first.players.first.statistics.first.goals.conceded).to eq(2)
  end
end
