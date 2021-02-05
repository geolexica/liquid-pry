require_relative 'lib/liquid/pry/version'

Gem::Specification.new do |spec|
  spec.name          = "liquid-pry"
  spec.version       = Liquid::Pry::VERSION
  spec.authors       = ["Ribose Inc."]
  spec.email         = ["open.source@ribose.com"]

  spec.summary       = "Brings Pry to Liquid templates."
  spec.homepage      = "https://github.com/geolexica/liquid-pry"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  all_files_in_git = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files         = all_files_in_git.reject { |f| f.match(%r{^(test|spec|features|.github)/}) }
  spec.executables   = all_files_in_git.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("liquid")
  spec.add_runtime_dependency("pry")

  spec.add_development_dependency("rspec", "~> 3.9")
end
