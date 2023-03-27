# frozen_string_literal: true

module ApiSports
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end

    def get_single_resource(url, params: {}, headers: {}, &dig_block)
      response = get_request(url, params: params, headers: headers)
      yield(response)
    end

    def handle_response(response)
      errors = response.body["errors"]

      if errors.empty?
        response
      else
        raise Error, errors
      end
    end
  end
end
