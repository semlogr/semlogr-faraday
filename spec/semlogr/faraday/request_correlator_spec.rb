require 'semlogr'
require 'semlogr/faraday/request_correlator'

module Semlogr
  module Faraday
    describe RequestCorrelator do
      let(:env) { { request_headers: {} } }
      let(:expected_result) { 200 }
      let(:app) { spy('app') }

      subject { RequestCorrelator.new(app) }

      before do
        allow(app)
          .to receive(:call)
          .and_return(expected_result)

        expect(Semlogr::LogContext)
          .to receive(:get_property)
          .with(:correlation_id)
          .and_return(correlation_id)
      end

      context 'with correlation_id in context' do
        let(:correlation_id) { '1234' }

        it 'adds correlation id to request header' do
          subject.call(env)

          expect(env[:request_headers]['X-Correlation-Id']).to eq(correlation_id)
        end

        it 'calls and returns result of child app' do
          result = subject.call(env)
          expect(result).to eq(expected_result)
        end
      end
    end
  end
end
