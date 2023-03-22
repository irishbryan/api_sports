# frozen_string_literal: true

module ApiSports
  class Timezone < Object
    def initialize(name)
      # API returns an array of strings,
      # one for each timezone name, wrapping with :name key
      # to make it easier to access (e.g. timezone.name)
      super to_ostruct({ name: name })
    end
  end
end
