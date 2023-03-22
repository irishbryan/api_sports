# frozen_string_literal: true

RSpec.describe "Countries" do
  it "can list all countries" do
    stub = stub_request("countries", response: stub_response(fixture: "countries/list"))
    client = ApiSports::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    countries = client.countries.list

    expect(countries).to be_a(ApiSports::Collection)
    expect(countries.data.count).to eq(165)
    expect(countries.data.first.class).to eq(ApiSports::Country)
  end

  it "can retrieve based on country code" do
    stub = stub_request("countries", response: stub_response(fixture: "countries/retrieve"))
    client = ApiSports::Client.new(api_key: "fake", adapter: :test, stubs: stub)
    countries = client.countries.retrieve(country_code: "GB")

    expect(countries).to be_a(ApiSports::Collection)
    expect(countries.data.count).to eq(1)
    expect(countries.data.first.class).to eq(ApiSports::Country)
    expect(countries.data.first.name).to eq("England")
  end
end
