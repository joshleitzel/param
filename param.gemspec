# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'param/version'

Gem::Specification.new do |spec|
  spec.name          = 'param'
  spec.version       = Param::VERSION
  spec.authors       = ['Josh Leitzel']
  spec.email         = ['joshleitzel@gmail.com']

  spec.summary       = 'Adds a `from_param` method to ActiveRecord models to complement `to_param`'
  spec.description   = 'This tiny library makes it easier to add a `to_param` and complementary `from_param` method to your ActiveRecord models.'
  spec.homepage      = 'https://github.com/joshleitzel/param'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 4.2.0'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_development_dependency 'rubocop', '~> 0.42'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
end
