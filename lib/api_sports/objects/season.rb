# frozen_string_literal: true

module ApiSports
  class Season < Object
    def initialize(year)
      super({ year: year })
    end
  end
end
