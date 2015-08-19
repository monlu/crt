# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crt/version'

Gem::Specification.new do |spec|
  spec.name          = "crt"
  spec.version       = Crt::VERSION
  spec.authors       = ["monlu"]
  spec.email         = ["glu@canvas.is"]

  spec.summary       = %q{Canvas Rails Template}
  spec.description   = %q{Prototype of Canvas Rails Template}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ['crt']
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', Crt::RAILS_VERSION
  spec.add_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10"
end
