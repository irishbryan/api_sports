# frozen_string_literal: true

module ApiSports
  class OddsResource < Resource
    def pre_match_odds(fixture_id:, bookmaker_id: nil, **params)
      response = get_request("odds",
                             params: { fixture: fixture_id,
                                       bookmaker: bookmaker_id }.compact.merge(params))
      Collection.from_response(response, type: Odds)
    end

    def mapping(**params)
      response = get_request("odds/mapping", params: params)
      Collection.from_response(response, type: Fixture)
    end

    def bookmakers
      response = get_request("odds/bookmakers")
      Collection.from_response(response, type: Bookmaker)
    end

    def pre_match_bets
      response = get_request("odds/bets")
      Collection.from_response(response, type: Bet)
    end

    def live_odds(fixture_id:, bookmaker_id: nil, **params)
      response = get_request("odds/live",
                             params: { fixture: fixture_id,
                                       bookmaker: bookmaker_id }.compact.merge(params))
      Collection.from_response(response, type: Odds)
    end

    def live_bets
      response = get_request("odds/live/bets")
      Collection.from_response(response, type: Bet)
    end
  end
end
