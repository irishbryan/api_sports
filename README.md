# ApiSports API Rubygem [BETA]

An unofficial ruby gem to integrate [API-Sports](https://api-sports.io/#) sports data into your app.

[API-Sports](https://api-sports.io/) provides sports data APIs. This gem is an unofficial wrapper providing lightweight integration of sports data into an application or service. This library does not attempt to support all API capabilities but instead focuses on the most used endpoints (e.g. retrieving game data). Coverage summary:

| Sport                   | API-Sports Documentation                                                 | Library Support    |
| :---------------------- | :----------------------------------------------------------------------- | :----------------- |
| Football/Soccer         | [API-Football Docs](https://api-sports.io/documentation/football/v3)     | :white_check_mark: |
| Basketball              | [API-Basketball Docs](https://api-sports.io/documentation/basketball/v1) | :construction:     |
| American Football (NFL) | [API-NFL Docs](https://api-sports.io/documentation/nfl/v1)               | :construction:     |

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add api-sports

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install api-sports

## Usage

**Prerequisite:** Set an environment variable `API_SPORTS_KEY` that contains the API key provided by [API-Sports](https://api-sports.io).

```ruby
client = ApiSports::Client.new(api_key: ENV["API_SPORTS_KEY"])

# client has a reference to instances of resource objects corresponding API endpoints
# e.g. client.leagues will access `/leagues` endpoint data.
# e.g. client.fixtures will access `/fixtures` endpoint data.
# etc.
# Parameters can be passed as needed to respective methods.
fixtures = client.fixtures.list(
  league: 39, # Premier League
  season: 2022,
  date: "2022-09-03",
  status: "FT"
)

# Additional resources (e.g. `/fixtures/lineups`) can be accessed
# by chaining the method calls. For clarify required parameters have been
# identified and made required paremeters when possible (additional parameters may be passed also)
fixtures = client.fixtures.head_to_head(first_team_id: 33, second_team_id: 34)

# Responses will include pagination information included in `paging` attribute of API responses
fixtures.total
fixtures.current_page
fixtures.total_pages
```

## Acknowledgements

Hat tip to [tolbkni](vultr.rb) and [GoRails](https://gorails.com/episodes/api-requests-with-faraday) for inspiration on how to structure this library.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/irishbryan/api_sports.
