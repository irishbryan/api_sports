# frozen_string_literal: true

module ApiSports
  class Collection
    attr_reader :data, :total, :current_page, :total_pages

    def self.from_response(response, type:)
      body = response.body
      new(
        data: body["response"].map { |attrs| type.new(attrs) },
        total: body["results"],
        current_page: body["paging"]["current"],
        total_pages: body["paging"]["total"]
      )
    end

    def initialize(data:, total:, current_page:, total_pages:)
      @data = data
      @total = total
      @current_page = current_page
      @total_pages = total_pages
    end
  end
end
