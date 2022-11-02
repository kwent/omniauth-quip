# frozen_string_literal: true

require File.expand_path(
  File.join('..', 'lib', 'omniauth', 'quip', 'version'),
  __FILE__
)

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-quip'
  gem.version       = OmniAuth::Quip::VERSION
  gem.license       = 'MIT'
  gem.summary       = %(A Quip OAuth2 strategy for OmniAuth 1.x)
  gem.description   = %(A Quip OAuth2 strategy for OmniAuth 1.x. This allows you to login to Quip with your Ruby app.)
  gem.authors       = ['Quentin Rousseau']
  gem.email         = ['contact@quent.in']
  gem.homepage      = 'https://github.com/kwent/omniauth-quip'

  gem.files         = `git ls-files`.split("\n")
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.1'

  gem.add_runtime_dependency 'omniauth', '>= 1.1.1'
  gem.add_runtime_dependency 'omniauth-oauth2', '>= 1.5'

  gem.add_development_dependency 'rake', '~> 12.0'
  gem.add_development_dependency 'rspec', '~> 3.6'
  gem.add_development_dependency 'rubocop', '~> 0.49'
end
