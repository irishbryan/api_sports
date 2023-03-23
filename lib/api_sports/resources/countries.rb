# frozen_string_literal: true

module ApiSports
  class CountriesResource < Resource
    def list(**params)
      response = get_request("countries", params: params)
      Collection.from_response(response, type: Country)
    end

    def retrieve(country_name:)
      response = get_single_resource("countries", params: { name: country_name }) do |r|
        r.body["response"].first
      end
      Country.new(response)
    end
  end
end
