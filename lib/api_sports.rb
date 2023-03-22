# frozen_string_literal: true

require "faraday"
require_relative "api_sports/version"

module ApiSports
  autoload :Client, "api_sports/client"
  autoload :Object, "api_sports/object"
  autoload :Collection, "api_sports/collection"
  autoload :Error, "api_sports/error"
  autoload :Resource, "api_sports/resource"

  # Classes used to return a nicer object wrapping the response data
  autoload :Country, "api_sports/objects/country"

  # Category of API calls
  autoload :CountriesResource, "api_sports/resources/countries"
end
