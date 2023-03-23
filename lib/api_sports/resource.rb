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
      case response.status
      when 400
        raise Error, "Your request was malformed. #{response.body['']}"
      end

      response
    end
  end
end
