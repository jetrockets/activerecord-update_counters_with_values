
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "update_counters_with_values/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-update_counters_with_values"
  spec.version       = ActiveRecord::UpdateCountersWithValues::VERSION
  spec.authors       = ["Igor Alexandrov"]
  spec.email         = ["igor.alexandrov@gmail.com"]

  spec.summary       = %q{Increment ActiveRecord counter and update instance value}
  spec.homepage      = "https://github.com/jetrockets/activerecord-increment-counter-and-value"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord', '>= 4.2'

  spec.add_development_dependency "bundler", "~> 1.16"

  spec.add_development_dependency 'pry'

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
