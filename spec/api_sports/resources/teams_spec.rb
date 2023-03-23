RSpec.describe "Teams" do
  it "can retrieve list of teams based on search" do
    stub = stub_request("teams?search=Manchester%20United", response: stub_response(fixture: "teams/list"))
    client = create_test_client(stub: stub)
    teams = client.teams.list(search: "Manchester United")

    expect(teams).to be_a(ApiSports::Collection)
    expect(teams.data.count).to eq(5)
    expect(teams.data.first.class).to eq(ApiSports::Team)
    expect(teams.data.first.team.name).to eq("Manchester United")
  end

  it "can retrieve specific team based on id" do
    stub = stub_request("teams?team=33", response: stub_response(fixture: "teams/retrieve"))
    client = create_test_client(stub: stub)
    team = client.teams.retrieve(team_id: 33)

    expect(team.class).to eq(ApiSports::Team)
    expect(team.name).to eq("Manchester United")
  end

  it "can retrieve statistics for a team" do
    stub = stub_request("teams/statistics?team=33&league=39&season=2022", response: stub_response(fixture: "teams/statistics"))
    client = create_test_client(stub: stub)
    statistics = client.teams.statistics(team_id: 33, league_id: 39, season_id: 2022)

    expect(statistics).to be_a(ApiSports::TeamStatistics)
    expect(statistics.goals.for.total.total).to eq(41)
    expect(statistics.form).to eq("LLWWWWLWDWDWLWWWWWDLWDWWLD")
  end

  it "can retrieve seasons for a team" do
    stub = stub_request("teams/seasons?team=33", response: stub_response(fixture: "teams/seasons"))
    client = create_test_client(stub: stub)
    seasons = client.teams.seasons(team_id: 33)

    expect(seasons).to be_a(ApiSports::Collection)
    expect(seasons.data.count).to eq(13)
    expect(seasons.data.first.class).to eq(ApiSports::Season)
    expect(seasons.data.first.year).to eq(2010)
  end
end
