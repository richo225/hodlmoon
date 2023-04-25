lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hodlmoon/version'

Gem::Specification.new do |spec|
  spec.name = 'hodlmoon'
  spec.required_ruby_version = Hodlmoon::RUBY_VERSION
  spec.version       = Hodlmoon::VERSION
  spec.authors       = ['Richard Bates']
  spec.email         = ['richo225@gmail.com']

  spec.description   = 'A command line tool for crytocurrency data. When moon?'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/richo225/hodlmoon'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '0.18.0'
  spec.add_dependency 'json', '~> 2.6', '>= 2.6.2'
  spec.add_dependency 'launchy', '~> 2.4.3'
  spec.add_dependency 'terminal-table', '~> 1.8.0'
  spec.add_dependency 'thor', '>= 1.0', '< 1.1'

  spec.add_development_dependency 'aruba', '~> 1.0.0'
  spec.add_development_dependency 'bundler', '~> 1.17.3'
  spec.add_development_dependency 'cucumber', '>= 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rexml', '~> 3.2', '>= 3.2.4'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
  spec.add_development_dependency 'rubocop', '~> 0.78.0'
  spec.add_development_dependency 'vcr', '~> 5.0.0'
  spec.add_development_dependency 'webmock', '~> 3.8.0'
end
