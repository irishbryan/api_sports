# frozen_string_literal: true

RSpec.describe "TimeZones" do
  it "can list timezones" do
    stub = stub_request("timezone", response: stub_response(fixture: "timezones/list"))
    client = create_test_client(stub: stub)
    timezones = client.timezones.list

    expect(timezones).to be_a(ApiSports::Collection)
    expect(timezones.total).to eq(427)
    expect(timezones.data.first.class).to eq(ApiSports::Timezone)
    expect(timezones.data.first.name).to eq("Africa/Abidjan")
  end
end
