# frozen_string_literal: true

require "ostruct"

module ApiSports
  # Class to make access to response data easier
  # e.g. response.name instead of response['name']
  # Inspired by https://github.com/tolbkni/vultr.rb
  # and https://gorails.com/episodes/api-requests-with-faraday

  class Object < OpenStruct
    def initialize(attributes)
      super to_ostruct(attributes)
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.transform_values { | value | to_ostruct(value) })
      elsif obj.is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else
        obj # Assumed to be primitive type
      end
    end
  end
end
