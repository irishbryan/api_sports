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
  autoload :Timezone, "api_sports/objects/timezone"
  autoload :League, "api_sports/objects/league"
  autoload :Season, "api_sports/objects/season"
  autoload :Team, "api_sports/objects/team"
  autoload :Venue, "api_sports/objects/venue"
  autoload :TeamStatistics, "api_sports/objects/team_statistics"

  # Category of API calls
  autoload :CountriesResource, "api_sports/resources/countries"
  autoload :TimezonesResource, "api_sports/resources/timezones"
  autoload :LeaguesResource, "api_sports/resources/leagues"
  autoload :SeasonsResource, "api_sports/resources/seasons"
  autoload :TeamsResource, "api_sports/resources/teams"
  autoload :VenuesResource, "api_sports/resources/venues"
end
