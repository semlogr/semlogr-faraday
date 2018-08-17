lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'semlogr/faraday/version'

Gem::Specification.new do |spec|
  spec.name          = 'semlogr-faraday'
  spec.version       = Semlogr::Faraday::VERSION
  spec.authors       = ['Stefan Sedich']
  spec.email         = ['stefan.sedich@gmail.com']

  spec.summary       = 'Semlogr integration for faraday.'
  spec.description   = 'Semlogr integration for faraday providing features such as correlation id propogation.'
  spec.homepage      = 'https://github.com/semlogr/semlogr-faraday'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.12'
  spec.add_dependency 'semlogr', '~> 0.3'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.53'
end
