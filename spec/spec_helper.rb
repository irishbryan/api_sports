# frozen_string_literal: true

require "api_sports"
require_relative "./api_sports/spec_helpers"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Include helpers
  config.include ApiSports::SpecHelpers

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
