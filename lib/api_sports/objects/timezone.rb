# frozen_string_literal: true

module ApiSports
  class Timezone < Object
    def initialize(name)
      super({ name: name })
    end
  end
end
