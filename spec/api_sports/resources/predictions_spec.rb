# frozen_string_literal: true

RSpec.describe "Predictions" do
  it "can retrieve predictions for a fixture" do
    stub = stub_request("predictions?fixture=198772", response: stub_response(fixture: "predictions/retrieve"))
    client = create_test_client(stub: stub)
    prediction = client.predictions.retrieve(fixture_id: 198772)

    expect(prediction).to be_a(ApiSports::Prediction)
    expect(prediction.winner.name).to eq("Manchester United")
  end
end
