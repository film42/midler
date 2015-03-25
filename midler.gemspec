# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'midler/version'

Gem::Specification.new do |spec|
  spec.name          = "midler"
  spec.version       = Midler::VERSION
  spec.authors       = ["Garrett Thornburg"]
  spec.email         = ["garrett.thornburg@mx.com"]
  spec.summary       = "A variadic fork of the middleware gem"
  spec.description   = "A variadic fork of the middleware gem"
  spec.homepage      = "https://github.com/film42/midler"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-core", "~> 2.8.0"
  spec.add_development_dependency "rspec-expectations", "~> 2.8.0"
  spec.add_development_dependency "rspec-mocks", "~> 2.8.0"
end
