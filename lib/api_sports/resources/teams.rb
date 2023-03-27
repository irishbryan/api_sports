# frozen_string_literal: true

module ApiSports
  class TeamsResource < Resource
    def list(**params)
      response = get_request("teams", params: params)
      Collection.from_response(response, type: Team)
    end

    def retrieve(team_id:)
      response = get_single_resource("teams", params: { id: team_id }) do |r|
        r.body["response"].first.dig("team")
      end
      Team.new(response)
    end

    def statistics(league_id:, season_id:, team_id:)
      response = get_request("teams/statistics", params: { team: team_id, league: league_id, season: season_id })
      Statistics.new(response.body["response"])
    end

    def seasons(team_id:)
      response = get_request("teams/seasons", params: { team: team_id })
      Collection.from_response(response, type: Season)
    end
  end
end
