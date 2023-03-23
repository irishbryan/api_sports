# frozen_string_literal: true

module ApiSports
  class LeaguesResource < Resource
    def list(**params)
      response = get_request("leagues", params: params)
      Collection.from_response(response, type: League)
    end

    def retrieve(league_id:)
      League.new(get_single_resource("leagues", key: "league", params: { id: league_id }))
    end
  end
end
