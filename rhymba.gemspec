# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rhymba/version"

Gem::Specification.new do |spec|
  spec.name          = "rhymba-api"
  spec.version       = Rhymba::VERSION
  spec.authors       = ["neiman.wong"]
  spec.email         = ["info@vlgroup.com"]
  spec.summary       = %q{A Ruby wrapper for the Rhymba API}
  spec.description   = %q{A Ruby wrapper for the Rhymba API}
  spec.homepage      = "https://github.com/vlgroup"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'erubis', '~> 2.7.0'
  spec.add_development_dependency "json-schema"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "faraday", [">= 0.7", "< 0.10"]
  spec.add_runtime_dependency "faraday_middleware", "~> 0.8"
  spec.add_runtime_dependency "multi_json", ">= 1.0.3", "~> 1.0"
  spec.add_runtime_dependency "faye-websocket", "~> 0.9.2"
end
