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
    stub = stub_request("countries?name=Ireland", response: stub_response(fixture: "countries/list_by_name"))
    client = create_test_client(stub: stub)
    countries = client.countries.list(name: "Ireland")

    expect(countries).to be_a(ApiSports::Collection)
    expect(countries.data.first.name).to eq("Ireland")
  end
end
