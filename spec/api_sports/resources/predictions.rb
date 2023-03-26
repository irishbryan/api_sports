# frozen_string_literal: true

module ApiSports
  class PredictionsResource < Resource
    def retrieve(fixture_id:)
      response = get_single_resource("predictions", params: { fixture: fixture_id }) do |r|
        r.body["response"].first.dig("predictions")
      end
      Prediction.new(response)
    end
  end
end
