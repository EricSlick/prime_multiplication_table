# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
pkg = File.expand_path('../pkg', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$LOAD_PATH.unshift(pkg) unless $LOAD_PATH.include?(pkg)
require 'prime_multiplication_table/version'

Gem::Specification.new do |spec|
  spec.name          = "prime_multiplication_table"
  spec.version       = PrimeMultiplicationTable::VERSION
  spec.authors       = ["Eric Slick"]
  spec.email         = ["github@slickfamily.net"]
  spec.summary       = %q{Outputs Prime Multiplications Table.}
  spec.description   = %q{Outputs Prime Multiplications Table.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
