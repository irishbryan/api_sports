# frozen_string_literal: true

module ApiSports
  class CountriesResource < Resource
    def list(**params)
      response = get_request("countries", params: params)
      Collection.from_response(response, type: Country)
    end
  end
end
