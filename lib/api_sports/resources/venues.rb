# frozen_string_literal: true

module ApiSports
  class VenuesResource < Resource
    def retrieve(**params)
      response = get_single_resource("venues", params: params) do |r|
        r.body["response"].first
      end
      Venue.new(response)
    end
  end
end
