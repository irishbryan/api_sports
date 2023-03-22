# frozen_string_literal: true

module ApiSports
  class Client
    BASE_URL = "https://v3.football.api-sports.io/"

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def countries
      CountriesResource.new(self)
    end

    def timezones
      TimezonesResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.headers = { "x-apisports-key": api_key }
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end
  end
end
