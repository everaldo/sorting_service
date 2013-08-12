# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sorting_service/version'

Gem::Specification.new do |spec|
  spec.name          = "sorting_service"
  spec.version       = SortingService::VERSION
  spec.authors       = ["Everaldo Gomes"]
  spec.email         = ["everaldo.gomes@gmail.com"]
  spec.description   = %q{Technical Assessment - Sorting Service Use Case}
  spec.summary       = %q{Books Sorting Service}
  spec.homepage      = "https://github.com/everaldo/sorting_service"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cucumber"
end
