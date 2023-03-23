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

    def get_single_resource(url, key:, params: {}, headers: {})
      get_request(url, params: params, headers: headers).body["response"].first.dig(key)
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
