# frozen_string_literal: true

module ApiSports
  class CountriesResource < Resource
    def list(**params)
      response = get_request("countries", params: params)
      Collection.from_response(response, type: Country)
    end

    # Limit country retrieve by country code, important
    # to note that some country codes return multiple countries.
    # For example "GB" will return England, Scotland, Wales,
    # and Northern Ireland.
    def retrieve(country_code:)
      list(code: country_code)
    end
  end
end
