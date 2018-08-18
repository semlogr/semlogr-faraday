![Codeship Status for semlogr/semlogr-faraday](https://codeship.com/projects/48b7dd70-8499-0136-e016-5e4de864be62/status?branch=master)

# Semlogr integration for Faraday

This integration provides the ability to propogate a correlation id from the current log Semlogr context to
your outgoing Faraday requests.

## Installation

To install:

    gem install semlogr-faraday

Or if using bundler, add semlogr to your Gemfile:

    gem 'semlogr-faraday'

then:

    bundle install

## Getting Started

Simply configure the RequestCorrelator middleware on your Faraday instance, it will propogate the `correlation_id` property from your current Semlogr ambient log context as an outgoing X-Correlation-Id header on the request.

This can be used in combination with the [semlogr-rack](https://github.com/semlogr/semlogr-rack) extension to
provide a full end to end proprogation of correlation ids between your services.

```ruby
require 'semlogr/faraday'

faraday = Faraday.new('http://test.com') do |c|
  c.request :semlogr_request_correlator

  c.adapter Faraday.default_adapter
end

faraday.get('/test')
```

## Development

After cloning the repository run `bundle install` to get up and running, to run the specs just run `rake spec`.

## Contributing

See anything broken or something you would like to improve? feel free to submit an issue or better yet a pull request!
