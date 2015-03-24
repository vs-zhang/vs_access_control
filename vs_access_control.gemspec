# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vs_access_control/version'

Gem::Specification.new do |spec|
  spec.name          = "vs_access_control"
  spec.version       = VsAccessControl::VERSION
  spec.authors       = ["Vincent Zhang"]
  spec.email         = ["shipei1209@gmail.com"]
  spec.summary       = %q{Simple Access Control for Rails}
  spec.description   = %q{Simple Access Control for Rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
