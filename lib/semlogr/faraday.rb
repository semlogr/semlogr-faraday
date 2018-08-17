require 'semlogr/faraday/request_correlator'
require 'faraday'

module Semlogr
  module Faraday
    if ::Faraday::Middleware.respond_to?(:register_middleware)
      ::Faraday::Request.register_middleware(
        semlogr_request_correlator: -> { Semlogr::Faraday::RequestCorrelator }
      )
    end
  end
end
