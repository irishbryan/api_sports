# frozen_string_literal: true

module ApiSports
  class SeasonsResource < Resource
    def list
      response = get_request("leagues/seasons")
      Collection.from_response(response, type: Season)
    end
  end
end
