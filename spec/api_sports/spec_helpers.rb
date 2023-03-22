# frozen_string_literal: true

require "faraday"

module ApiSports
  module SpecHelpers
    def stub_request(path, response:)
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get(path) { |env| response }
      end
    end

    def stub_response(fixture:, status: 200, headers: { "Content-Type": "application/json" })
      [status, headers, File.read("spec/fixtures/#{fixture}.json")]
    end
  end
end
