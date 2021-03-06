# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-scalingo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Léo Unbekandt"]
  gem.email         = ["leo@scalingo.com"]
  gem.description   = %q{Official OmniAuth strategy for Scalingo.}
  gem.summary       = %q{Official OmniAuth strategy for Scalingo.}
  gem.homepage      = "https://github.com/Scalingo/omniauth-scalingo"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-scalingo"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Scalingo::VERSION

  gem.add_dependency 'omniauth', '~> 1.5'
  gem.add_dependency 'omniauth-oauth2', '>= 1.4.0', '< 2.0'
  gem.add_development_dependency 'rspec', '~> 3.5'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
