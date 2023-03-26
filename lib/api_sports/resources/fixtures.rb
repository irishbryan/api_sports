# frozen_string_literal: true

module ApiSports
  class FixturesResource < Resource
    def list(**params)
      response = get_request("fixtures", params: params)
      Collection.from_response(response, type: Fixture)
    end

    def rounds(league_id:, season_id:, current_round_only: false)
      response = get_request("fixtures/rounds",
                             params: { league: league_id,
                                       season: season_id,
                                       current: current_round_only }.compact)
      Collection.from_response(response, type: FixtureRound)
    end

    def head_to_head(first_team_id:, second_team_id:, **params)
      response = get_request("fixtures/headtohead", params: { h2h: "#{first_team_id}-#{second_team_id}" }.merge(params))
      Collection.from_response(response, type: Fixture)
    end

    def statistics(fixture_id:, **params)
      response = get_request("fixtures/statistics", params: { fixture: fixture_id }.merge(params))
      Collection.from_response(response, type: Statistics)
    end

    def events(fixture_id:, **params)
      response = get_request("fixtures/events", params: { fixture: fixture_id }.merge(params))
      Collection.from_response(response, type: Event)
    end

    def lineups(fixture_id:, **params)
      response = get_request("fixtures/lineups", params: { fixture: fixture_id }.merge(params))
      Collection.from_response(response, type: Lineup)
    end

    def player_statistics(fixture_id:, **params)
      response = get_request("fixtures/players", params: { fixture: fixture_id }.merge(params))
      Collection.from_response(response, type: Player)
    end
  end
end
