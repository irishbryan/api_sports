# frozen_string_literal: true

module ApiSports
  class LeaguesResource < Resource
    def list(**params)
      response = get_request("leagues", params: params)
      Collection.from_response(response, type: League)
    end

    def retrieve(league_id:)
      response = get_single_resource("leagues", params: { id: league_id }) do |r|
        r.body["response"].first.dig("league")
      end
      League.new(response)
    end

    def seasons
      response = get_request("leagues/seasons")
      Collection.from_response(response, type: Season)
    end

  end
end
