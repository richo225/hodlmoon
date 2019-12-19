
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hodlmoon/version'

Gem::Specification.new do |spec|
  spec.name          = 'hodlmoon'
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

  spec.add_dependency 'httparty', '>= 0.15.7', '< 0.18.0'
  spec.add_dependency 'launchy', '~> 2.4.3'
  spec.add_dependency 'terminal-table', '~> 1.8.0'
  spec.add_dependency 'thor', '~> 0.20.0'

  spec.add_development_dependency 'aruba', '~> 0.14.2'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'coveralls', '~> 0.7.1'
  spec.add_development_dependency 'cucumber', '>= 3.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.52.1'
  spec.add_development_dependency 'vcr', '~> 3.0.3'
  spec.add_development_dependency 'webmock', '~> 3.2.1'
end
