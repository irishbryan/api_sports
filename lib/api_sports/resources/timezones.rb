# frozen_string_literal: true

module ApiSports
  class TimezonesResource < Resource
    def list(**params)
      response = get_request("timezone", params: params)
      Collection.from_response(response, type: Timezone)
    end
  end
end
