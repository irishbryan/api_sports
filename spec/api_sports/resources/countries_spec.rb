# frozen_string_literal: true

RSpec.describe "Countries" do
  it "can list all countries" do
    stub = stub_request("countries", response: stub_response(fixture: "countries/list"))
    client = create_test_client(stub: stub)
    countries = client.countries.list

    expect(countries).to be_a(ApiSports::Collection)
    expect(countries.data.count).to eq(165)
    expect(countries.data.first.class).to eq(ApiSports::Country)
  end

  it "can retrieve based on country name" do
    stub = stub_request("countries?name=Ireland", response: stub_response(fixture: "countries/retrieve"))
    client = create_test_client(stub: stub)
    country = client.countries.retrieve(country_name: "Ireland")

    expect(country.class).to eq(ApiSports::Country)
    expect(country.name).to eq("Ireland")
  end
end
