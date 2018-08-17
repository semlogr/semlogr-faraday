require 'semlogr'

module Semlogr
  module Faraday
    class RequestCorrelator
      def initialize(app, opts = {})
        @app = app
        @id_property = opts[:id_property] || :correlation_id
        @id_header = opts[:id_header] || 'X-Correlation-Id'
      end

      def call(env)
        correlation_id = Semlogr::LogContext.get_property(@id_property)
        env[:request_headers][@id_header] = correlation_id if correlation_id

        @app.call(env)
      end
    end
  end
end
