# frozen_string_literal: true

RSpec.describe "Seasons" do
  it "can list seasons" do
    stub = stub_request("leagues/seasons", response: stub_response(fixture: "seasons/list"))
    client = ApiSports::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    seasons = client.seasons.list

    expect(seasons).to be_a(ApiSports::Collection)
    expect(seasons.total).to eq(17)
    expect(seasons.data.first.class).to eq(ApiSports::Season)
    expect(seasons.data.first.year).to eq(2008)
  end
end
