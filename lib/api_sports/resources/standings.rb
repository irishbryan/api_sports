# frozen_string_literal: true

module ApiSports
  class StandingsResource < Resource
    def retrieve(league_id:, season_id: nil, team_id: nil)
      response = get_request("standings",
                             params: { league: league_id,
                                       season: season_id,
                                       team: team_id }.compact)
      Collection.from_response(response, type: Standing) do |body|
        body["response"].first["league"]["standings"].first.map { |attrs| Standing.new(attrs) }
      end
    end
  end
end
