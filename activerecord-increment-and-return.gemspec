
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activerecord/increment/and/return/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-increment-and-return"
  spec.version       = ActiverecordIncrementAndReturn::VERSION
  spec.authors       = ["Igor Alexandrov"]
  spec.email         = ["igor.alexandrov@gmail.com"]

  spec.summary       = %q{Increment ActiveRecord counters and update instance value}
  spec.homepage      = "https://github.com/jetrockets/perfect_audit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord', '>= 4.2'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
