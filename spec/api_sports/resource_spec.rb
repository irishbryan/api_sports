# frozen_string_literal: true

RSpec.describe "Resource" do
  it "can retrieve a single resource using custom dig block" do
    stub = stub_request("countries?name=Ireland", response: stub_response(fixture: "countries/list_by_name"))
    client = create_test_client(stub: stub)
    country_name = client.countries.get_single_resource("countries", params: { name: "Ireland" }) do |r|
      r.body["response"].first["name"]
    end

    expect(country_name).to eq("Ireland")
  end

  it "can correctly raise missing params error" do
    stub = stub_request("odds", response: stub_response(fixture: "errors/missing_required_params"))
    client = create_test_client(stub: stub)
    expect { client.odds.get_request("odds") }.to raise_error(ApiSports::Error)
  end

  it "can correctly raise invalid api key error" do
    stub = stub_request("odds", response: stub_response(fixture: "errors/invalid_api_key"))
    client = create_test_client(stub: stub)
    expect { client.odds.get_request("odds") }.to raise_error(ApiSports::Error)
  end

  it "can correctly raise multiple errors" do
    stub = stub_request("odds", response: stub_response(fixture: "errors/multiple_errors"))
    client = create_test_client(stub: stub)
    expect { client.odds.get_request("odds") }.to raise_error(ApiSports::Error)
  end
end
