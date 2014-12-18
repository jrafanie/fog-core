require 'uri'

module Fog
  class URI
    def self.build(options = {})
      raise ArgumentError, "Only an options hash is supported" unless options.is_a?(Hash)

      # We can delegate to URI::Generic.build once it supports
      # ipv6 literal addresses, merged here:
      # https://github.com/ruby/ruby/pull/765
      uri = ::URI::Generic.build(options.reject { |k, _| k == :host })
      uri.hostname = options[:host]
      uri
    end
  end
end
